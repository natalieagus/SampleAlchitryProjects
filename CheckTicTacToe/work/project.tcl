set projDir "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CheckTicTacToe/work/vivado"
set projName "CheckTicTacToe"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CheckTicTacToe/work/verilog/au_top_0.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CheckTicTacToe/work/verilog/reset_conditioner_1.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CheckTicTacToe/work/verilog/button_conditioner_2.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CheckTicTacToe/work/verilog/edge_detector_3.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CheckTicTacToe/work/verilog/checktest_4.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CheckTicTacToe/work/verilog/pipeline_5.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CheckTicTacToe/work/verilog/counter_6.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CheckTicTacToe/work/verilog/checkplace_7.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CheckTicTacToe/work/verilog/registers_8.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CheckTicTacToe/work/verilog/alu16_9.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CheckTicTacToe/work/verilog/adder16_10.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CheckTicTacToe/work/verilog/shifter16_11.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CheckTicTacToe/work/verilog/compare16_12.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CheckTicTacToe/work/verilog/bool16_13.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CheckTicTacToe/work/constraint/alchitry.xdc" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CheckTicTacToe/work/constraint/io.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
