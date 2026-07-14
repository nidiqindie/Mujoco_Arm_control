#!/usr/bin/env zsh

# 严格模式（推荐）：遇错即停，未定义变量报错，管道中任一命令失败则整体失败
set -euo pipefail
SCRIPT_NAME="./$(basename "$0")"
# 用法说明函数
usage() {
    cat <<EOF

用法: $SCRIPT_NAME <命令> [参数...]

可用命令:
  x86          运行x86下的程序
  arm          运行arm下的程序
  -h, --help   显示此帮助信息

示例:
$SCRIPT_NAME x86
$SCRIPT_NAME arm
EOF
}

# 若未提供任何参数，打印用法并退出
if [[ $# -eq 0 ]]; then
    usage
    exit 1
fi

# 取出第一个参数作为命令，剩余参数通过 $@ 可在分支内继续使用
COMMAND="$1"
shift

# 根据命令执行对应逻辑
case "$COMMAND" in
    x86)
        # ========== 在这里编写“启动”的代码 ==========
        echo "正在执行x86的测试代码..."
        cd ./command_python_x86
        python test1.py
        cd ../
        
        ;;

    arm)
        # ========== 在这里编写“停止”的代码 ==========
        echo "正在执行arm的测试代码..."
        cd ./command_python_arm
        python test1.py
        cd ../
        ;;


    -h|--help)
        usage
        exit 0
        ;;

    *)
        # 输入参数不匹配时打印用法并退出
        echo "错误：未知命令 '$COMMAND'" >&2
        usage
        exit 1
        ;;
esac