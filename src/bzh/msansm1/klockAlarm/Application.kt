package bzh.msansm1.klockAlarm

import com.fasterxml.jackson.databind.SerializationFeature
import freemarker.cache.ClassTemplateLoader
import io.ktor.application.Application
import io.ktor.application.call
import io.ktor.application.install
import io.ktor.features.*
import io.ktor.freemarker.FreeMarker
import io.ktor.freemarker.FreeMarkerContent
import io.ktor.http.HttpStatusCode
import io.ktor.http.Parameters
import io.ktor.http.content.resources
import io.ktor.http.content.static
import io.ktor.jackson.jackson
import io.ktor.request.receive
import io.ktor.response.respond
import io.ktor.routing.get
import io.ktor.routing.post
import io.ktor.routing.routing
import java.util.*

fun main(args: Array<String>): Unit = io.ktor.server.netty.EngineMain.main(args)

@Suppress("unused") // Referenced in application.conf
@kotlin.jvm.JvmOverloads
fun Application.module(testing: Boolean = false) {
    install(FreeMarker) {
        templateLoader = ClassTemplateLoader(this::class.java.classLoader, "templates")
    }

    install(Compression) {
        gzip {
            priority = 1.0
        }
        deflate {
            priority = 10.0
            minimumSize(1024) // condition
        }
    }

    install(DataConversion)

    install(ContentNegotiation) {
        jackson {
            enable(SerializationFeature.INDENT_OUTPUT)
        }
    }

    routing {
        get("/") {
            call.respond(FreeMarkerContent("index.ftl", mapOf("data" to getAlarms()), ""))
        }
        post("/") {
            val params = call.receive<Parameters>()
            var id = params["id"].orEmpty()
            var prefixId = ""
            if (id.isEmpty()) {
                id = UUID.randomUUID().toString()
            } else {
                prefixId = "_${id}"
            }
            val alarm = Alarm(id,
                    params["hour${prefixId}"].orEmpty(),
                    params["music${prefixId}"].orEmpty(),
                    params["enabled${prefixId}"].orEmpty().checkboxValueToBoolean(),
                    params["monday${prefixId}"].orEmpty().checkboxValueToBoolean(),
                    params["tuesday${prefixId}"].orEmpty().checkboxValueToBoolean(),
                    params["wednesday${prefixId}"].orEmpty().checkboxValueToBoolean(),
                    params["thursday${prefixId}"].orEmpty().checkboxValueToBoolean(),
                    params["friday${prefixId}"].orEmpty().checkboxValueToBoolean(),
                    params["saturday${prefixId}"].orEmpty().checkboxValueToBoolean(),
                    params["sunday${prefixId}"].orEmpty().checkboxValueToBoolean())
            if (params["delete${prefixId}"].orEmpty().isNotEmpty()) {
                deleteAlarm(alarm)
            } else {
                saveAlarms(alarm)
            }
            call.respond(FreeMarkerContent("index.ftl", mapOf("data" to getAlarms()), ""))
        }

        static("/static") {
            resources("static")
        }

        get("/api/v1") {
            val alarms = getAlarms();
            call.respond(alarms)
        }
        post("/api/v1") {
            val alarm = call.receive(Alarm::class)
            saveAlarms(alarm)
            call.respond(HttpStatusCode.OK)
        }
    }
}

data class Alarm(
        val id: String,
        val hour: String,
        val music: String,
        val enabled: Boolean,
        val monday: Boolean,
        val tuesday: Boolean,
        val wednesday: Boolean,
        val thursday: Boolean,
        val friday: Boolean,
        val saturday: Boolean,
        val sunday: Boolean
) {
    override fun toString(): String =
            "$id||$hour||$music||$enabled||$monday||$tuesday||$wednesday||$thursday||$friday||$saturday||$sunday"
}

fun buildAlarm(alarmStr: String): Alarm {
    val params = alarmStr.split("||")
    return Alarm(
            params[0], params[1], params[2], params[3].toBoolean(), params[4].toBoolean(),
            params[5].toBoolean(), params[6].toBoolean(), params[7].toBoolean(), params[8].toBoolean(),
            params[9].toBoolean(), params[10].toBoolean()
    )
}

fun String.checkboxValueToBoolean(): Boolean {
    var res = false
    if ("on" == this) {
        res = true;
    }
    return res
}