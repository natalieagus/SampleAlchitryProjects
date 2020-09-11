set projDir "C:/Users/NatalieAgus/Desktop/BetaComponents/work/vivado"
set projName "BetaComponents"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/NatalieAgus/Desktop/BetaComponents/work/verilog/au_top_0.v" "C:/Users/NatalieAgus/Desktop/BetaComponents/work/verilog/beta_cpu_1.v" "C:/Users/NatalieAgus/Desktop/BetaComponents/work/verilog/counter_2.v" "C:/Users/NatalieAgus/Desktop/BetaComponents/work/verilog/edge_detector_3.v" "C:/Users/NatalieAgus/Desktop/BetaComponents/work/verilog/simple_dual_ram_4.v" "C:/Users/NatalieAgus/Desktop/BetaComponents/work/verilog/reset_conditioner_5.v" "C:/Users/NatalieAgus/Desktop/BetaComponents/work/verilog/multi_seven_seg_6.v" "C:/Users/NatalieAgus/Desktop/BetaComponents/work/verilog/multi_dec_ctr_7.v" "C:/Users/NatalieAgus/Desktop/BetaComponents/work/verilog/counter_8.v" "C:/Users/NatalieAgus/Desktop/BetaComponents/work/verilog/control_unit_9.v" "C:/Users/NatalieAgus/Desktop/BetaComponents/work/verilog/alu_10.v" "C:/Users/NatalieAgus/Desktop/BetaComponents/work/verilog/regfile_11.v" "C:/Users/NatalieAgus/Desktop/BetaComponents/work/verilog/counter_12.v" "C:/Users/NatalieAgus/Desktop/BetaComponents/work/verilog/seven_seg_13.v" "C:/Users/NatalieAgus/Desktop/BetaComponents/work/verilog/decoder_14.v" "C:/Users/NatalieAgus/Desktop/BetaComponents/work/verilog/decimal_counter_15.v" "C:/Users/NatalieAgus/Desktop/BetaComponents/work/verilog/adder_16.v" "C:/Users/NatalieAgus/Desktop/BetaComponents/work/verilog/boolean_17.v" "C:/Users/NatalieAgus/Desktop/BetaComponents/work/verilog/shifter_18.v" "C:/Users/NatalieAgus/Desktop/BetaComponents/work/verilog/compare_19.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/NatalieAgus/Desktop/BetaComponents/work/constraint/alchitry.xdc" "C:/Users/NatalieAgus/Desktop/BetaComponents/work/constraint/io.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
