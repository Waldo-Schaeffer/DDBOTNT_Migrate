import json

# 示例JSON数据
json_data = {
    "GroupSilence:1006022461": "",
    "GroupSilence:1131108614": "",
    "GroupSilence:166487082": "",
    "GroupSilence:240621346": "",
    "GroupSilence:524842826": "",
    "GroupSilence:537205434": "",
    "GroupSilence:539202422": "",
    "GroupSilence:549814625": "",
    "GroupSilence:651728431": "",
    "GroupSilence:667571612": "",
    "GroupSilence:708218802": "",
    "GroupSilence:716324208": "",
    "GroupSilence:732080822": "",
    "GroupSilence:752597951": "",
    "GroupSilence:768823148": "",
    "GroupSilence:810339385": "",
    "GroupSilence:865915509": "",
    "GroupSilence:867675278": "",
    "GroupSilence:874155212": "",
    "GroupSilence:905855530": "",
    "GroupSilence:912328371": "",
    "GroupSilence:950198965": "",
}

# 从键名中提取群号，并生成MySQL INSERT语句
sql_statements = []
for key in json_data:
    # 提取群号，假设格式固定为 "GroupSilence:<group_id>:0"
    group_id = key.split(':')[1]
    sql = f"INSERT INTO GroupSilence (group_id) VALUES ({group_id});"
    sql_statements.append(sql)

# 打印所有生成的INSERT语句
for sql in sql_statements:
    print(sql)
