package bzh.msansm1.klockAlarm

import java.util.*
import kotlin.collections.HashMap

class Scheduler {
    val alarmScheduled = HashMap<String, Timer>()

    fun scheduleAlarm(alarm: Alarm) {
        val timer = Timer("schedule", true);
        val date = Date()
        val period = 1000 * 60 * 60 * 24
//        timer.schedule(runAlarm(alarm.music), period)
        alarmScheduled[alarm.id] = timer
    }

    fun removeAlarm(alarm: Alarm) {

    }

}