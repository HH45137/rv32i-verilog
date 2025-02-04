@echo on

iverilog -o .\sim\wave .\rtl\tb_adder.v .\rtl\adder.v

start vvp.exe -n .\sim\wave -lxt2
echo "Wait..."
timeout /t 8
echo "Run CTRL+C"
taskkill /F /IM vvp.exe

gtkwave.exe .\sim\wave.vcd