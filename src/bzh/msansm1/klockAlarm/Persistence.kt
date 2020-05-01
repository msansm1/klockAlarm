package bzh.msansm1.klockAlarm

import java.io.File

fun getAlarms(): List<Alarm> {
    val alarms = ArrayList<Alarm>()
    File("/opt/alarms.txt").forEachLine { if (it.isNotEmpty()) alarms.add(buildAlarm(it)) }
    return alarms
}

fun saveAlarms(alarm: Alarm) {
    val alarms = getAlarms()
    val alarmStr = StringBuilder("")
    alarms.forEach { alarmStr.append("${it}\n") }
    alarmStr.append("$alarm\n")
    File("/opt/alarms.txt").writeText(alarmStr.toString())
}