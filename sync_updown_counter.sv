module sync_updown_counter #(parameter WIDTH=4)(
 input wire clk,
 input wire rst_n,
 input wire enable,
 input wire up,
 input wire load,
 input wire [WIDTH-1:0] load_val,
 output reg [WIDTH-1:0] count
);

 always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      count <= 0;
    end else if (load) begin
      count <= load_val;
    end else if (enable) begin
      count <= up ? count + 1 : count - 1;
    end
 end

endmodule
