######################################################
# Example configuration information for a 
# system under test (SUT) Section
######################################################
# General SUT info
system_vendor      = Lenovo
system_name        = Niagara
hw_avail           = Feb-2018
sw_avail           = Mar-2018

# Computation node info 
# [Node_Description: Hardware]
node_compute_syslbl = Intel Xeon Gold 6148
node_compute_order = 1
node_compute_count = 2
node_compute_purpose = compute
node_compute_hw_vendor = Lenovo
node_compute_hw_model = Intel Xeon Gold 6148
node_compute_hw_cpu_name = Intel Xeon Gold 6148
node_compute_hw_ncpuorder = 1 chips
node_compute_hw_nchips = 2
node_compute_hw_ncores = 40
node_compute_hw_ncoresperchip = 20
node_compute_hw_nthreadspercore = 40
node_compute_hw_cpu_char = Turbo up to 3.7 GHz
node_compute_hw_cpu_mhz = 2400
node_compute_hw_pcache = 32 KB I + 32 KB D on chip per core
node_compute_hw_scache = 512 KB I+D on chip per core
node_compute_hw_tcache000= 256 MB I+D on chip per chip
node_compute_hw_tcache001 = 16 MB shared / 4 cores
node_compute_hw_ocache = None
node_compute_hw_memory = 202 GB (8 x 32 GB 2Rx8 PC4-3200AA-R)
node_compute_hw_disk = None
node_compute_hw_other = None

#[Node_Description: Accelerator]
node_compute_hw_accel_model = Tesla V100-PCIE-16GB
node_compute_hw_accel_count = 4
node_compute_hw_accel_vendor= NVIDIA Corporation
node_compute_hw_accel_type  = GPU
node_compute_hw_accel_connect = PCIe 3.0 16x
node_compute_hw_accel_ecc    = Yes
node_compute_hw_accel_desc   = See Notes

#[Node_Description: Software]
node_compute_hw_adapter_fs_model = None
node_compute_hw_adapter_fs_count = 0
node_compute_hw_adapter_fs_slot_type = None
node_compute_hw_adapter_fs_data_rate = None
node_compute_hw_adapter_fs_ports_used = 0
node_compute_hw_adapter_fs_interconnect = None
node_compute_hw_adapter_fs_driver = None
node_compute_hw_adapter_fs_firmware = None
node_compute_sw_os000 = SUSE Linux Enterprise Linux Server 12
node_compute_sw_os001 = 4.12.14-94.41-default
node_compute_sw_localfile = xfs
node_compute_sw_sharedfile = None
node_compute_sw_state = Multi-user, run level 3
node_compute_sw_other = None

#[Fileserver]
node_fileserver_sw_state = Multi-User, run level 3
node_fileserver_sw_sharedfile = NFS
node_fileserver_sw_other = None
node_fileserver_sw_os = Red Hat Enterprise Linux Server release 7.6
node_fileserver_sw_localfile = None
node_fileserver_purpose = Fileserver
node_fileserver_order = 2
node_fileserver_syslbl = NFS
node_fileserver_hw_vendor = Big Storage Company
node_fileserver_hw_tcache = 39424 KB I+D on chip per chip
node_fileserver_hw_scache = 1 MB I+D on chip per core
node_fileserver_hw_pcache = 32 KB I + 32 KB D on chip per core
node_fileserver_hw_other = None
node_fileserver_hw_ocache = None
node_fileserver_hw_nthreadspercore = 1
node_fileserver_hw_ncpuorder = 1-2 chips
node_fileserver_hw_ncoresperchip = 28
node_fileserver_hw_ncores = 56
node_fileserver_hw_nchips = 2
node_fileserver_hw_model = BG650
node_fileserver_hw_memory = 768 GB (24 x 32 GB 2Rx4 PC4-2933Y-R)
node_fileserver_hw_disk = 1 x 1 TB 12 Gbps SAS 2.5" SSD (JBOD)
node_fileserver_hw_cpu_name = Intel Xeon Platinum 8280
node_fileserver_hw_cpu_mhz = 2700
node_fileserver_hw_cpu_char = None
node_fileserver_hw_adapter_fs_slot_type = PCI-Express 3.0 x16
node_fileserver_hw_adapter_fs_ports_used = 1
node_fileserver_hw_adapter_fs_interconnect = BG 5000 series 
node_fileserver_hw_adapter_fs_firmware = 10.9.0.1.0
node_fileserver_hw_adapter_fs_driver = 10.9.1.0.15
node_fileserver_hw_adapter_fs_data_rate = 100 Gb/s
node_fileserver_hw_adapter_fs_count = 1
node_fileserver_count = 1

#[Interconnect]
interconnect_fs_syslbl = Big Interconnect Company
interconnect_fs_order = 0
interconnect_fs_purpose = MPI Traffic
interconnect_fs_hw_vendor = Big Interconnect Company
interconnect_fs_hw_model = BI 100 Series
interconnect_fs_hw_switch_fs_model000= BI 100 Series 48 Port 2
interconnect_fs_hw_switch_fs_model001 = PSU
interconnect_fs_hw_switch_fs_count = 1
interconnect_fs_hw_switch_fs_ports = 48
interconnect_fs_hw_topo = Mesh
interconnect_fs_hw_switch_fs_data_rate = 100 Gb/s
interconnect_fs_hw_switch_fs_firmware = 10.3.0.0.60

#######################################################################
# End of SUT section
# If this config file were to be applied to several SUTs, edits would
# be needed only ABOVE this point.
######################################################################
