package bzh.msansm1.klockAlarm

import java.io.File

fun getAlarms(): List<Alarm> {
    val alarms = ArrayList<Alarm>()
    File("/opt/alarms.txt").forEachLine { if (it.isNotEmpty()) alarms.add(buildAlarm(it)) }
    return alarms
}

fun saveAlarms(alarms: Alarm) {
    File("/opt/alarms.txt").writeText(alarms.toString())
}