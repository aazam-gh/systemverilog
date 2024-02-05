module tb_sync_updown_counter;
 reg clk;
 reg rst_n;
 reg enable;
 reg up;
 reg load;
 reg [3:0] load_val;
 wire [3:0] count;

 // Instantiate the counter
 sync_updown_counter #(4) counter_inst (
    .clk(clk), .rst_n(rst_n), .enable(enable),
    .up(up), .load(load), .load_val(load_val),
    .count(count)
 );

 // Clock generation
 always #5 clk = ~clk;

 // Test sequence
 initial begin
    clk = 0;
    rst_n = 0;
    enable = 1;
    up = 1;
    load = 0;
    load_val = 4'b0000;
    #10;
    rst_n = 1;
    #10;
    load = 1;
    load_val = 4'b1010;
    #10;
    load = 0;
    #10;
    up = 0;
    #10;
    #50;
    $finish;
 end

 // Monitor
 initial begin
    $monitor("At time %t, count=%b", $time, count);
 end

 // Dump waveforms for viewing
 initial begin
    $dumpfile("waveforms.vcd");
    $dumpvars(0, tb_sync_updown_counter);
 end

endmodule
