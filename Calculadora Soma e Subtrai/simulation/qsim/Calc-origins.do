onerror {quit -f}
vlib work
vlog -work work Calc-origins.vo
vlog -work work Calc-origins.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.calculadora_soma_sub_vlg_vec_tst
vcd file -direction Calc-origins.msim.vcd
vcd add -internal calculadora_soma_sub_vlg_vec_tst/*
vcd add -internal calculadora_soma_sub_vlg_vec_tst/i1/*
add wave /*
run -all
