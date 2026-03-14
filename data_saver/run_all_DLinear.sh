#!/bin/bash

set -e  # 任意一个脚本报错就停止

# 获取项目根目录：data_saver 的上一级
ROOT_DIR="$(cd "$(dirname "$0")"/.. && pwd)"

# 切换到项目根目录，确保 scripts 中的 run.py 能正确找到
cd "$ROOT_DIR" || exit 1

echo "=========================================="
echo "Starting all DLinear long-term forecasting and saving datasets"
echo "Project root: $ROOT_DIR"
echo "Current dir : $(pwd)"
echo "=========================================="

bash "$ROOT_DIR/scripts/long_term_forecast/ETT_script/DLinear_ETTh1.sh"
echo "========== DLinear_ETTh1 done ============="

bash "$ROOT_DIR/scripts/long_term_forecast/ETT_script/DLinear_ETTh2.sh"
echo "========== DLinear_ETTh2 done ============="

bash "$ROOT_DIR/scripts/long_term_forecast/ETT_script/DLinear_ETTm1.sh"
echo "========== DLinear_ETTm1 done ============="

bash "$ROOT_DIR/scripts/long_term_forecast/ETT_script/DLinear_ETTm2.sh"
echo "========== DLinear_ETTm2 done ============="

bash "$ROOT_DIR/scripts/long_term_forecast/Exchange_script/DLinear_Exchange.sh"
echo "========== DLinear_Exchange done =========="

bash "$ROOT_DIR/scripts/long_term_forecast/Solar_script/DLinear_Solar.sh"
echo "========== DLinear_Solar done ============="

bash "$ROOT_DIR/scripts/long_term_forecast/Weather_script/DLinear_Weather.sh"
echo "========== DLinear_Weather done ==========="

bash "$ROOT_DIR/scripts/long_term_forecast/ECL_script/DLinear_ECL.sh"
echo "========== DLinear_Electricity done ======="

bash "$ROOT_DIR/scripts/long_term_forecast/Traffic_script/DLinear_Traffic.sh"
echo "========== DLinear_Traffic done ==========="

echo "=========================================="
echo "All datasets have been processed and saved successfully!"
echo "=========================================="
