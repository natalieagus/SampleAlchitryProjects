set projDir "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CounterGame/work/vivado"
set projName "CounterGame"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CounterGame/work/verilog/au_top_0.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CounterGame/work/verilog/multi_seven_seg_1.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CounterGame/work/verilog/game_miniBeta_2.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CounterGame/work/verilog/reset_conditioner_3.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CounterGame/work/verilog/edge_detector_4.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CounterGame/work/verilog/button_conditioner_5.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CounterGame/work/verilog/multi_dec_ctr_6.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CounterGame/work/verilog/counter_7.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CounterGame/work/verilog/seven_seg_8.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CounterGame/work/verilog/decoder_9.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CounterGame/work/verilog/alu_10.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CounterGame/work/verilog/game_CU_11.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CounterGame/work/verilog/game_miniRegfiles_12.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CounterGame/work/verilog/variable_counter_13.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CounterGame/work/verilog/counter_14.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CounterGame/work/verilog/pipeline_15.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CounterGame/work/verilog/decimal_counter_16.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CounterGame/work/verilog/adder_17.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CounterGame/work/verilog/boolean_18.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CounterGame/work/verilog/shifter_19.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CounterGame/work/verilog/compare_20.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CounterGame/work/verilog/edge_detector_21.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CounterGame/work/verilog/counter_22.v" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CounterGame/work/verilog/pn_gen_23.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CounterGame/work/constraint/alchitry.xdc" "C:/Users/NatalieAgus/Desktop/Alchitry\ Projects/CounterGame/work/constraint/io.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
