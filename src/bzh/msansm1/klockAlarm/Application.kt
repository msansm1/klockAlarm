package bzh.msansm1.klockAlarm

import com.fasterxml.jackson.databind.SerializationFeature
import freemarker.cache.ClassTemplateLoader
import io.ktor.application.Application
import io.ktor.application.call
import io.ktor.application.install
import io.ktor.features.*
import io.ktor.freemarker.FreeMarker
import io.ktor.freemarker.FreeMarkerContent
import io.ktor.http.content.resources
import io.ktor.http.content.static
import io.ktor.jackson.jackson
import io.ktor.request.receive
import io.ktor.response.respond
import io.ktor.response.respondText
import io.ktor.routing.get
import io.ktor.routing.routing

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

        // Static feature. Try to access `/static/ktor_logo.svg`
        static("/static") {
            resources("static")
        }

        get("/api/v1") {
            val alarms = getAlarms();
            call.respond(alarms)
        }

        install(StatusPages) {
            exception<AuthenticationException> { cause ->
                call.respond(HttpStatusCode.Unauthorized)
            }
            exception<AuthorizationException> { cause ->
                call.respond(HttpStatusCode.Forbidden)
            }

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