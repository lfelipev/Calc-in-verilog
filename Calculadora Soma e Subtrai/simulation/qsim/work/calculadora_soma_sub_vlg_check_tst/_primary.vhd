library verilog;
use verilog.vl_types.all;
entity calculadora_soma_sub_vlg_check_tst is
    port(
        result          : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end calculadora_soma_sub_vlg_check_tst;
