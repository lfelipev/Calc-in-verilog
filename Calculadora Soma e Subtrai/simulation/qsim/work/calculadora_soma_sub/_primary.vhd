library verilog;
use verilog.vl_types.all;
entity calculadora_soma_sub is
    port(
        reset           : in     vl_logic;
        enter           : in     vl_logic;
        data_in         : in     vl_logic_vector(7 downto 0);
        result          : out    vl_logic_vector(7 downto 0)
    );
end calculadora_soma_sub;
