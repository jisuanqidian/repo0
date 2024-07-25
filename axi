class mst_axi_cfg extends svt_axi_port_configuration;
    `uvm_object_utils(mst_axi_cfg)

    function new(string name="mst_axi_cfg");
        super.new(name);

        sys_cfg = svt_axi_system_configuration::type_id::create("sys_cfg");

        is_active = 1;
        silent_mode = 1;
        enable_reporting = 0;
        enable_tracing = 0;
        uvm_reg_enable = 0;
        transaction_coverage_enable = 0;
        addr_width = 32;
        data_width = 32;
        id_width = 8;
        axi_interface_type = svt_axi_port_configuration::AXI4;
        axi_port_kind = svt_axi_port_configuration::AXI_MASTER;
        read_addr_chan_idle_val = svt_axi_port_configuration::INACTIVE_CHAN_X_VAL;
        read_data_chan_idle_val = svt_axi_port_configuration::INACTIVE_CHAN_X_VAL;
        write_addr_chan_idle_val = svt_axi_port_configuration::INACTIVE_CHAN_X_VAL;
        write_data_chan_idle_val = svt_axi_port_configuration::INACTIVE_CHAN_X_VAL;
        write_resp_chan_idle_val = svt_axi_port_configuration::INACTIVE_CHAN_X_VAL;
    endfunction: new
endclass: mst_axi_cfg

class mst_axi_env extends uvm_env;
    `uvm_component_utils(mst_axi_env)

    mst_axi_cfg cfg;

    svt_axi_master_agent axi_uvc;
    svt_axi_master_sequencer axi_sqr;

    uvm_reg_block ral;

    function new(string name="mst_axi_env", uvm_component parent=null);
        super.new(name, parent);

        if (!uvm_config_db#(mst_axi_cfg)::get(this, "", "cfg", cfg)) begin
            `uvm_fatal(get_full_name(), "cfg not created or configured")
        end

        if (cfg.uvm_reg_enable && !uvm_config_db#(uvm_reg_block)::get(this, "", "ral", ral)) begin
            `uvm_fatal(get_full_name(), "ral not created or configured")
        end
    endfunction: new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        if (cfg != null) uvm_config_db#(svt_axi_port_configuration)::set(this, "axi_uvc", "cfg", cfg);
        if (ral != null) uvm_config_db#(uvm_reg_block)::set(this, "axi_uvc", "axi_regmodel", ral);

        axi_uvc = svt_axi_master_agent::type_id::create("axi_uvc", this);
    endfunction: build_phase

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);

        axi_sqr = axi_uvc.sequencer;
    endfunction: connect_phase

    function void start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);

        axi_uvc.monitor.set_report_id_verbosity("report_xact", UVM_FULL);

        `uvm_info(get_full_name(), $sformatf("\n*************** AXI MST UVC CFG ***************\n%0s", this.cfg.sprint()), UVM_LOW)
    endfunction: start_of_simulation_phase
endclass: mst_axi_env

package mst_axi_pkg;
import uvm_pkg::*;
import svt_uvm_pkg::*;
import svt_axi_uvm_pkg::*;

`include "mst_axi_cfg.sv"
`include "mst_axi_env.sv"
`include "mst_axi_seq.sv"
endpackage: mst_axi_pkg

// refer to the following file to get more examples:
// $DESIGNWARE_HOME/vip/svt/amba_svt/latest/axi_master_agent_svt/sverilog/src/vcs/svt_axi_master_sequence_collection.svp

virtual class cmn_mst_axi_base_seq extends svt_axi_master_base_sequence;
    rand bit[`SVT_AXI_MAX_ADDR_WIDTH-1:0] addr;
    rand svt_axi_transaction::atomic_type_enum atomic_type;
    rand svt_axi_transaction::burst_type_enum burst_type;
    rand svt_axi_transaction::burst_size_enum burst_size;
    rand int unsigned burst_length;

    constraint c_burst_length {
        burst_length inside { [1:256] };
    }

    function new(string name="cmn_mst_axi_base_seq");
        super.new(name);
    endfunction
endclass: cmn_mst_axi_base_seq

class cmn_mst_axi_wr_seq extends cmn_mst_axi_base_seq;
    `uvm_object_utils(cmn_mst_axi_wr_seq)

    rand bit[`SVT_AXI_MAX_DATA_WIDTH-1:0] data[$];

    constraint c_burst_length {
        data.size() == burst_length;
    }

    function new(string name="cmn_mst_axi_wr_seq");
        super.new(name);
    endfunction

    virtual task body();
        super.body();

`ifdef UVM_VERSION_1_2
        `uvm_do_with(req, { 
            addr == local::addr;
            atomic_type == local::atomic_type;
            burst_type == local::burst_type;
            burst_size == local::burst_size;
            burst_length == local::burst_length;

            data.size() == burst_length;
            foreach (data[i]) {
                data[i] == local::data[i];
            }

            wstrb.size() == burst_length;
            foreach (wstrb[i]) {
                wstrb[i] == (1<<(1<<burst_size)) - 1;
            }

            data_before_addr == 0;
            xact_type == svt_axi_transaction::WRITE;
        })
`else
        `uvm_do(req, get_sequencer(), -1, { 
            addr == local::addr;
            atomic_type == local::atomic_type;
            burst_type == local::burst_type;
            burst_size == local::burst_size;
            burst_length == local::burst_length;

            data.size() == burst_length;
            foreach (data[i]) {
                data[i] == local::data[i];
            }

            wstrb.size() == burst_length;
            foreach (wstrb[i]) {
                wstrb[i] == (1<<(1<<burst_size)) - 1;
            }

            data_before_addr == 0;
            xact_type == svt_axi_transaction::WRITE;
        })
`endif

        get_response(rsp);
    endtask: body
endclass: cmn_mst_axi_wr_seq

class cmn_mst_axi_rd_seq extends cmn_mst_axi_base_seq;
    `uvm_object_utils(cmn_mst_axi_rd_seq)

    bit[`SVT_AXI_MAX_DATA_WIDTH-1:0] data[$];

    function new(string name="cmn_mst_axi_rd_seq");
        super.new(name);
    endfunction

    virtual task body();
        super.body();

`ifdef UVM_VERSION_1_2
        `uvm_do_with(req, { 
            addr == local::addr;
            atomic_type == local::atomic_type;
            burst_type == local::burst_type;
            burst_size == local::burst_size;
            burst_length == local::burst_length;

            xact_type == svt_axi_transaction::READ;
        })
`else
        `uvm_do(req, get_sequencer(), -1, { 
            addr == local::addr;
            atomic_type == local::atomic_type;
            burst_type == local::burst_type;
            burst_size == local::burst_size;
            burst_length == local::burst_length;

            xact_type == svt_axi_transaction::READ;
        })
`endif

        get_response(rsp);

        data = rsp.data;
    endtask: body
endclass: cmn_mst_axi_rd_seq

class slv_axi_cfg extends svt_axi_port_configuration;
    `uvm_object_utils(slv_axi_cfg)

    function new(string name="slv_axi_cfg");
        super.new(name);

        sys_cfg = svt_axi_system_configuration::type_id::create("sys_cfg");

        is_active = 1;
        silent_mode = 1;
        enable_reporting = 0;
        enable_tracing = 0;
        uvm_reg_enable = 0;
        transaction_coverage_enable = 0;
        addr_width = 32;
        data_width = 32;
        id_width = 8;
        axi_interface_type = svt_axi_port_configuration::AXI4;
        axi_port_kind = svt_axi_port_configuration::AXI_SLAVE;
        read_addr_chan_idle_val = svt_axi_port_configuration::INACTIVE_CHAN_X_VAL;
        read_data_chan_idle_val = svt_axi_port_configuration::INACTIVE_CHAN_X_VAL;
        write_addr_chan_idle_val = svt_axi_port_configuration::INACTIVE_CHAN_X_VAL;
        write_data_chan_idle_val = svt_axi_port_configuration::INACTIVE_CHAN_X_VAL;
        write_resp_chan_idle_val = svt_axi_port_configuration::INACTIVE_CHAN_X_VAL;
    endfunction: new
endclass: slv_axi_cfg

class slv_axi_env extends uvm_env;
    `uvm_component_utils(slv_axi_env)

    slv_axi_cfg cfg;

    svt_axi_slave_agent axi_uvc;
    svt_axi_slave_sequencer axi_sqr;

    function new(string name="slv_axi_env", uvm_component parent=null);
        super.new(name, parent);

        if (!uvm_config_db#(slv_axi_cfg)::get(this, "", "cfg", cfg)) begin
            `uvm_fatal(get_full_name(), "cfg not created or configured")
        end
    endfunction: new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        uvm_config_db#(uvm_object_wrapper)::set(
            this,
            "axi_uvc.sequencer.run_phase",
            "default_sequence",
            svt_axi_slave_memory_sequence::type_id::get()
        );

        uvm_config_db#(svt_axi_port_configuration)::set(this, "axi_uvc", "cfg", cfg);
        axi_uvc = svt_axi_slave_agent::type_id::create("axi_uvc", this);
    endfunction: build_phase

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);

        axi_sqr = axi_uvc.sequencer;
    endfunction: connect_phase

    function void start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);

        axi_uvc.monitor.set_report_id_verbosity("report_xact", UVM_FULL);

        `uvm_info(get_full_name(), $sformatf("\n*************** AXI SLV UVC CFG ***************\n%0s", this.cfg.sprint()), UVM_LOW)
    endfunction: start_of_simulation_phase
endclass: slv_axi_env

package slv_axi_pkg;
import uvm_pkg::*;
import svt_uvm_pkg::*;
import svt_axi_uvm_pkg::*;

`include "slv_axi_cfg.sv"
`include "slv_axi_env.sv"
endpackage: slv_axi_pkg
