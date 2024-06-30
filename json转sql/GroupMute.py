import json

# 示例JSON数据
json_data = {
    "GroupMute:166487082:0": "",
    "GroupMute:369668706:0": "",
    "GroupMute:462227099:0": "",
    "GroupMute:696840817:0": "",
    "GroupMute:732080822:0": "",
    "GroupMute:798136421:0": "",
    "GroupMute:865915509:0": ""
}

# 从键名中提取群号，并生成MySQL INSERT语句
sql_statements = []
for key in json_data:
    # 提取群号，假设格式固定为 "GroupMute:<group_id>:0"
    group_id = key.split(':')[1]
    sql = f"INSERT INTO groupmute (group_id) VALUES ({group_id});"
    sql_statements.append(sql)

# 打印所有生成的INSERT语句
for sql in sql_statements:
    print(sql)
