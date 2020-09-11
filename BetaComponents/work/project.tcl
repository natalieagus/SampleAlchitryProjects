set projDir "C:/Users/NatalieAgus/Desktop/SampleAlchitryProjects/BetaComponents/work/vivado"
set projName "BetaComponents"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/NatalieAgus/Desktop/SampleAlchitryProjects/BetaComponents/work/verilog/au_top_0.v" "C:/Users/NatalieAgus/Desktop/SampleAlchitryProjects/BetaComponents/work/verilog/beta_cpu_1.v" "C:/Users/NatalieAgus/Desktop/SampleAlchitryProjects/BetaComponents/work/verilog/counter_2.v" "C:/Users/NatalieAgus/Desktop/SampleAlchitryProjects/BetaComponents/work/verilog/edge_detector_3.v" "C:/Users/NatalieAgus/Desktop/SampleAlchitryProjects/BetaComponents/work/verilog/simple_dual_ram_4.v" "C:/Users/NatalieAgus/Desktop/SampleAlchitryProjects/BetaComponents/work/verilog/reset_conditioner_5.v" "C:/Users/NatalieAgus/Desktop/SampleAlchitryProjects/BetaComponents/work/verilog/control_unit_6.v" "C:/Users/NatalieAgus/Desktop/SampleAlchitryProjects/BetaComponents/work/verilog/alu_7.v" "C:/Users/NatalieAgus/Desktop/SampleAlchitryProjects/BetaComponents/work/verilog/regfile_8.v" "C:/Users/NatalieAgus/Desktop/SampleAlchitryProjects/BetaComponents/work/verilog/adder_9.v" "C:/Users/NatalieAgus/Desktop/SampleAlchitryProjects/BetaComponents/work/verilog/boolean_10.v" "C:/Users/NatalieAgus/Desktop/SampleAlchitryProjects/BetaComponents/work/verilog/shifter_11.v" "C:/Users/NatalieAgus/Desktop/SampleAlchitryProjects/BetaComponents/work/verilog/compare_12.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/NatalieAgus/Desktop/SampleAlchitryProjects/BetaComponents/work/constraint/alchitry.xdc" "C:/Users/NatalieAgus/Desktop/SampleAlchitryProjects/BetaComponents/work/constraint/io.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
