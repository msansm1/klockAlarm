<#-- @ftlvariable name="data" type="bzh.msansm1.klockAlarm.Alarm" -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Klock Alarm</title>

    <link rel="stylesheet" href="/static/styles.css">
</head>
<body>
<#if error??>
<p style="color:red;">${error}</p>
</#if>
<h1>Alarms</h1>
<h2>Alarms configured</h2>
<div></div>

<div>
    <#list data as alarm>
        <div>
            <div>
                <div>Music</div>
                <div><span>${alarm.music}</span></div>
                <div>Hour</div>
                <div><span>${alarm.hour}</span></div>
                <div><input type="checkbox" id="enabled_${alarm.id}" name="enabled_${alarm.id}" disabled <#if alarm.enabled>checked</#if>>
                    <label for="enabled">Enabled</label></div>
            </div>
            <div>
                <div><input type="checkbox" id="monday_${alarm.id}" name="monday_${alarm.id}" disabled <#if alarm.monday>checked</#if>>
                    <label for="monday">Monday</label></div>
                <div><input type="checkbox" id="tuesday_${alarm.id}" name="tuesday_${alarm.id}" disabled <#if alarm.tuesday>checked</#if>>
                    <label for="tuesday">Tuesday</label></div>
                <div><input type="checkbox" id="wednesday_${alarm.id}" name="wednesday_${alarm.id}" disabled <#if alarm.wednesday>checked</#if>>
                    <label for="wednesday">Wednesday</label></div>
                <div><input type="checkbox" id="thursday_${alarm.id}" name="thursday_${alarm.id}" disabled <#if alarm.thursday>checked</#if>>
                    <label for="thursday">Thursday</label></div>
                <div><input type="checkbox" id="friday_${alarm.id}" name="friday_${alarm.id}" disabled <#if alarm.friday>checked</#if>>
                    <label for="monday">Friday</label></div>
                <div><input type="checkbox" id="saturday_${alarm.id}" name="saturday_${alarm.id}" disabled <#if alarm.saturday>checked</#if>>
                    <label for="saturday">Saturday</label></div>
                <div><input type="checkbox" id="sunday_${alarm.id}" name="sunday_${alarm.id}" disabled <#if alarm.sunday>checked</#if>>
                    <label for="sunday">Sunday</label></div>
            </div>
        </div>
    </#list>
</div>

<div></div>
<div>
    <div>
        <div>Music</div>
        <div><select></select></div>
        <div>Hour</div>
        <div><input type="text"></div>
        <div><input type="checkbox" id="enabled" name="enabled">
            <label for="enabled">Enabled</label></div>
    </div>
    <div>
        <div><input type="checkbox" id="monday" name="monday">
            <label for="monday">Monday</label></div>
        <div><input type="checkbox" id="tuesday" name="tuesday">
            <label for="tuesday">Tuesday</label></div>
        <div><input type="checkbox" id="wednesday" name="wednesday">
            <label for="wednesday">Wednesday</label></div>
        <div><input type="checkbox" id="thursday" name="thursday">
            <label for="thursday">Thursday</label></div>
        <div><input type="checkbox" id="friday" name="friday">
            <label for="monday">Friday</label></div>
        <div><input type="checkbox" id="saturday" name="saturday">
            <label for="saturday">Saturday</label></div>
        <div><input type="checkbox" id="sunday" name="sunday">
            <label for="sunday">Sunday</label></div>
    </div>
    <button name="Add alarm"></button>
</div>
</body>
</html>
