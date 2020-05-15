<#-- @ftlvariable name="data" type="bzh.msansm1.klockAlarm.Alarm" -->
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>Klock Alarm</title>

    <link rel="stylesheet" href="/static/styles.css">

    <script type="text/javaScript">
	function updateAlarm(id) {
	    console.log(id);
		document.getElementById(id).submit();
	}
    </script>
</head>
<body>
    <#if error??>
    <p style="color:red;">${error}</p>
    </#if>
    <h1>Alarms</h1>
    <h2>Alarms configured</h2>
    <div></div>

    <div class="alarms">
        <#list data as alarm>
            <form method="post" action="/" name="update_${alarm.id}" id="update_${alarm.id}">
                <div class="alarm">
                    <input type="hidden" id="id_${alarm.id}" name="id" value="${alarm.id}">
                    <div class="alarm-field-text-disabled">
                        <div class="alarm-field">Music</div>
                        <div class="alarm-field"><span>${alarm.music}</span></div>
                        <input type="hidden" id="music_${alarm.id}" name="music_${alarm.id}" value="${alarm.music}">
                    </div>
                    <div class="alarm-field-text-disabled">
                        <div class="alarm-field">Hour</div>
                        <div class="alarm-field"><span>${alarm.hour}</span></div>
                        <input type="hidden" id="hour_${alarm.id}" name="hour_${alarm.id}" value="${alarm.hour}">
                    </div>
                    <div class="alarm-field-text-disabled">
                        <div class="alarm-field"><input type="checkbox" id="enabled_${alarm.id}" name="enabled_${alarm.id}" onclick="javascript:updateAlarm('update_${alarm.id}')" <#if alarm.enabled>checked</#if>>
                            <label for="enabled_${alarm.id}">Enabled</label></div>
                    </div>
                    <div class="alarm-field-text-disabled">
                        <div class="alarm-field"><input type="checkbox" id="monday_${alarm.id}" name="monday_${alarm.id}" onclick="javascript:updateAlarm('update_${alarm.id}')" <#if alarm.monday>checked</#if>>
                            <label for="monday_${alarm.id}">Monday</label></div>
                    </div>
                    <div class="alarm-field-text-disabled">
                        <div class="alarm-field"><input type="checkbox" id="tuesday_${alarm.id}" name="tuesday_${alarm.id}" onclick="javascript:updateAlarm('update_${alarm.id}')" <#if alarm.tuesday>checked</#if>>
                            <label for="tuesday_${alarm.id}">Tuesday</label></div>
                    </div>
                    <div class="alarm-field-text-disabled">
                        <div class="alarm-field"><input type="checkbox" id="wednesday_${alarm.id}" name="wednesday_${alarm.id}" onclick="javascript:updateAlarm('update_${alarm.id}')" <#if alarm.wednesday>checked</#if>>
                            <label for="wednesday_${alarm.id}">Wednesday</label></div>
                    </div>
                    <div class="alarm-field-text-disabled">
                        <div class="alarm-field"><input type="checkbox" id="thursday_${alarm.id}" name="thursday_${alarm.id}" onclick="javascript:updateAlarm('update_${alarm.id}')" <#if alarm.thursday>checked</#if>>
                            <label for="thursday_${alarm.id}">Thursday</label></div>
                    </div>
                    <div class="alarm-field-text-disabled">
                        <div class="alarm-field"><input type="checkbox" id="friday_${alarm.id}" name="friday_${alarm.id}" onclick="javascript:updateAlarm('update_${alarm.id}')" <#if alarm.friday>checked</#if>>
                            <label for="friday_${alarm.id}">Friday</label></div>
                    </div>
                    <div class="alarm-field-text-disabled">
                        <div class="alarm-field"><input type="checkbox" id="saturday_${alarm.id}" name="saturday_${alarm.id}" onclick="javascript:updateAlarm('update_${alarm.id}')" <#if alarm.saturday>checked</#if>>
                            <label for="saturday_${alarm.id}">Saturday</label></div>
                    </div>
                    <div class="alarm-field-text-disabled">
                        <div class="alarm-field"><input type="checkbox" id="sunday_${alarm.id}" name="sunday_${alarm.id}" onclick="javascript:updateAlarm('update_${alarm.id}')" <#if alarm.sunday>checked</#if>>
                            <label for="sunday_${alarm.id}">Sunday</label></div>
                    </div>
                    <div class="alarm-field-text-disabled">
                        <div class="alarm-field">
                            <button name="delete_${alarm.id}" value="delete_${alarm.id}" type="submit">Delete alarm</button>
                        </div>
                    </div>
                </div>
            </form>
        </#list>
    </div>

    <h2>New Alarm</h2>
    <form method="post" action="/" name="add_alarm" id="add_alarm">
        <div class="alarm">
                <div class="alarm-field-text-disabled">
                    <div class="alarm-field">Music</div>
                    <div class="alarm-field"><select id="music" name="music">
                        <option value="111">111</option>
                        <option value="222">222</option>
                    </select></div>
                </div>
                <div class="alarm-field-text-disabled">
                    <div class="alarm-field">Hour</div>
                    <div class="alarm-field"><input type="text" id="hour" name="hour"></div>
                </div>
                <div class="alarm-field-text-disabled">
                    <div class="alarm-field"><input type="checkbox" id="enabled" name="enabled">
                        <label for="enabled">Enabled</label></div>
                </div>
                <div class="alarm-field-text-disabled">
                    <div class="alarm-field"><input type="checkbox" id="monday" name="monday">
                        <label for="monday">Monday</label></div>
                </div>
                <div class="alarm-field-text-disabled">
                    <div class="alarm-field"><input type="checkbox" id="tuesday" name="tuesday">
                        <label for="tuesday">Tuesday</label></div>
                </div>
                <div class="alarm-field-text-disabled">
                    <div class="alarm-field"><input type="checkbox" id="wednesday" name="wednesday">
                        <label for="wednesday">Wednesday</label></div>
                </div>
                <div class="alarm-field-text-disabled">
                    <div class="alarm-field"><input type="checkbox" id="thursday" name="thursday">
                        <label for="thursday">Thursday</label></div>
                </div>
                <div class="alarm-field-text-disabled">
                    <div class="alarm-field"><input type="checkbox" id="friday" name="friday">
                        <label for="friday">Friday</label></div>
                </div>
                <div class="alarm-field-text-disabled">
                    <div class="alarm-field"><input type="checkbox" id="saturday" name="saturday">
                        <label for="saturday">Saturday</label></div>
                </div>
                <div class="alarm-field-text-disabled">
                    <div class="alarm-field"><input type="checkbox" id="sunday" name="sunday">
                        <label for="sunday">Sunday</label></div>
                </div>
                <div class="alarm-field-text-disabled">
                    <div class="alarm-field">
                        <button name="Add_alarm" value="Add_alarm" type="submit">Add alarm</button>
                    </div>
                </div>
        </div>
    </form>
</body>
</html>
