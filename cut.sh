 #!/bin/bash
awk -F: '{print $1}' /etc/passwd
cut -d: -f1 /etc/passwd
# 使用 sed 的替换功能,将/etc/passwd 文件中:后面的所有内容替换为空(仅显示用户名)
sed 's/:.*//' /etc/passwd
