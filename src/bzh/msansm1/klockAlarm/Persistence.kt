package bzh.msansm1.klockAlarm

import java.io.File

fun getAlarms(): List<Alarm> {
    val alarms = ArrayList<Alarm>()
    File("/opt/klockAlarm/alarms.txt").forEachLine { if (it.isNotEmpty()) alarms.add(buildAlarm(it)) }
    return alarms
}

fun saveAlarms(alarm: Alarm) {
    val alarms = getAlarms()
    val alarmStr = StringBuilder("")
    alarms.forEach { if (it.id != alarm.id) alarmStr.append("${it}\n") }
    alarmStr.append("$alarm\n")
    File("/opt/klockAlarm/alarms.txt").writeText(alarmStr.toString())
}

fun deleteAlarm(alarm: Alarm) {
    val alarms = getAlarms()
    val alarmStr = StringBuilder("")
    alarms.forEach { if (it.id != alarm.id) alarmStr.append("${it}\n") }
    File("/opt/klockAlarm/alarms.txt").writeText(alarmStr.toString())
}