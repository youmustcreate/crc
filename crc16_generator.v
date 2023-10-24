module crc16_generator (
    input  [95:0]     data_in_ori    ,
    input             clk            ,
    input             rst            ,
    input             start          ,
    output  reg       valid          ,
    output [15:0]     crc_16     
);

reg [15:0] crc_reg;
reg [15:0] crc_out;
wire [7:0] data_in[11:0];

generate
    genvar j;
    for (j=0;j<12;j=j+1)begin
        assign data_in[j] = data_in_ori[j*8+7:0+j*8];
    end
endgenerate


wire [7:0] data_r_0;
wire [7:0] data_r_1;
wire [7:0] data_r_2;
wire [7:0] data_r_3;
wire [7:0] data_r_4;
wire [7:0] data_r_5;
wire [7:0] data_r_6;
wire [7:0] data_r_7;
wire [7:0] data_r_8;
wire [7:0] data_r_9;
wire [7:0] data_r_10;
wire [7:0] data_r_11;

generate
    genvar i;
    for (i=0;i<8;i=i+1)begin
        assign data_r_0[7-i] =  data_in[11][i];
        assign data_r_1[7-i] =  data_in[10][i];
        assign data_r_2[7-i] =  data_in[9][i];
        assign data_r_3[7-i] =  data_in[8][i];
        assign data_r_4[7-i] =  data_in[7][i];
        assign data_r_5[7-i] =  data_in[6][i];
        assign data_r_6[7-i] =  data_in[5][i];
        assign data_r_7[7-i] =  data_in[4][i];
        assign data_r_8[7-i] =  data_in[3][i];
        assign data_r_9[7-i] =  data_in[2][i];
        assign data_r_10[7-i] = data_in[1][i];
        assign data_r_11[7-i] = data_in[0][i];
    end
endgenerate


reg  [7:0]  data   ;
reg  [7:0]  state  ;
reg  [7:0]  count  ;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state   <= 0           ;
        count   <= 0           ;
        valid   <= 0           ; 
    end else begin
        case(state)
        0:begin
            crc_reg <= 16'hFFFF ;
            if(start)begin
                state   <= 1        ;
                valid   <= 0        ;
                data    <= data_r_0 ;
                count   <= 0        ;
            end
        end

        1:begin
            count <= count + 1;
            if(count == 8)begin
                state <= 2;
                data  <= data_r_1;
                count <= 0;
            end else begin
                if ((crc_reg[15] ^ data[7]) == 1'b1) begin
                    crc_reg = {crc_reg[14:0], 1'b0} ^ 16'h8005;
                end else begin
                    crc_reg = {crc_reg[14:0], 1'b0};
                end
                data <= data << 1;
            end
        end

        2:begin
            count <= count + 1;
            if(count == 8)begin
                state <= 3;
                data  <= data_r_2;
                count <= 0;
            end else begin
                if ((crc_reg[15] ^ data[7]) == 1'b1) begin
                    crc_reg = {crc_reg[14:0], 1'b0} ^ 16'h8005;
                end else begin
                    crc_reg = {crc_reg[14:0], 1'b0};
                end
                data <= data << 1;
            end
        end


        3:begin
            count <= count + 1;
            if(count == 8)begin
                state <= 4;
                data  <= data_r_3;
                count <= 0;
            end else begin
                if ((crc_reg[15] ^ data[7]) == 1'b1) begin
                    crc_reg = {crc_reg[14:0], 1'b0} ^ 16'h8005;
                end else begin
                    crc_reg = {crc_reg[14:0], 1'b0};
                end
                data <= data << 1;
            end
        end


        4:begin
            count <= count + 1;
            if(count == 8)begin
                state <= 5;
                data  <= data_r_4;
                count <= 0;
            end else begin
                if ((crc_reg[15] ^ data[7]) == 1'b1) begin
                    crc_reg = {crc_reg[14:0], 1'b0} ^ 16'h8005;
                end else begin
                    crc_reg = {crc_reg[14:0], 1'b0};
                end
                data <= data << 1;
            end
        end


        5:begin
            count <= count + 1;
            if(count == 8)begin
                state <= 6;
                data  <= data_r_5;
                count <= 0;
            end else begin
                if ((crc_reg[15] ^ data[7]) == 1'b1) begin
                    crc_reg = {crc_reg[14:0], 1'b0} ^ 16'h8005;
                end else begin
                    crc_reg = {crc_reg[14:0], 1'b0};
                end
                data <= data << 1;
            end
        end


        6:begin
            count <= count + 1;
            if(count == 8)begin
                state <= 7;
                data  <= data_r_6;
                count <= 0;
            end else begin
                if ((crc_reg[15] ^ data[7]) == 1'b1) begin
                    crc_reg = {crc_reg[14:0], 1'b0} ^ 16'h8005;
                end else begin
                    crc_reg = {crc_reg[14:0], 1'b0};
                end
                data <= data << 1;
            end
        end


        7:begin
            count <= count + 1;
            if(count == 8)begin
                state <= 8;
                data  <= data_r_7;
                count <= 0;
            end else begin
                if ((crc_reg[15] ^ data[7]) == 1'b1) begin
                    crc_reg = {crc_reg[14:0], 1'b0} ^ 16'h8005;
                end else begin
                    crc_reg = {crc_reg[14:0], 1'b0};
                end
                data <= data << 1;
            end
        end

        8:begin
            count <= count + 1;
            if(count == 8)begin
                state <= 9;
                data  <= data_r_8;
                count <= 0;
            end else begin
                if ((crc_reg[15] ^ data[7]) == 1'b1) begin
                    crc_reg = {crc_reg[14:0], 1'b0} ^ 16'h8005;
                end else begin
                    crc_reg = {crc_reg[14:0], 1'b0};
                end
                data <= data << 1;
            end
        end

        9:begin
            count <= count + 1;
            if(count == 8)begin
                state <= 10;
                data  <= data_r_9;
                count <= 0;
            end else begin
                if ((crc_reg[15] ^ data[7]) == 1'b1) begin
                    crc_reg = {crc_reg[14:0], 1'b0} ^ 16'h8005;
                end else begin
                    crc_reg = {crc_reg[14:0], 1'b0};
                end
                data <= data << 1;
            end
        end

        10:begin
            count <= count + 1;
            if(count == 8)begin
                state <= 11;
                data  <= data_r_10;
                count <= 0;
            end else begin
                if ((crc_reg[15] ^ data[7]) == 1'b1) begin
                    crc_reg = {crc_reg[14:0], 1'b0} ^ 16'h8005;
                end else begin
                    crc_reg = {crc_reg[14:0], 1'b0};
                end
                data <= data << 1;
            end
        end

        11:begin
            count <= count + 1;
            if(count == 8)begin
                state   <= 12;
                data    <= data_r_11;
                count   <= 0;
            end else begin
                if ((crc_reg[15] ^ data[7]) == 1'b1) begin
                    crc_reg = {crc_reg[14:0], 1'b0} ^ 16'h8005;
                end else begin
                    crc_reg = {crc_reg[14:0], 1'b0};
                end
                data <= data << 1;
            end
        end


        12:begin
            count <= count + 1;
            if(count == 8)begin
                state   <= 0       ;
                crc_out <= crc_reg ;
                valid   <= 1       ;
                count   <= 0       ;
            end else begin
                if ((crc_reg[15] ^ data[7]) == 1'b1) begin
                    crc_reg = {crc_reg[14:0], 1'b0} ^ 16'h8005;
                end else begin
                    crc_reg = {crc_reg[14:0], 1'b0};
                end
                data <= data << 1;
            end
        end

        default:;
        endcase
    end
end


generate
    genvar k;
    for (k=0;k<16;k=k+1)begin
        assign crc_16[15-k] = crc_out[k];
    end
endgenerate



endmodule
