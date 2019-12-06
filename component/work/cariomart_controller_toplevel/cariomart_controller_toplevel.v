//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu Dec 05 22:12:44 2019
// Version: v11.8 SP1 11.8.1.12
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// cariomart_controller_toplevel
module cariomart_controller_toplevel(
    // Inputs
    ADCDirectInput_0,
    GPIO_0_IN,
    GPIO_1_IN,
    MSS_RESET_N,
    UART_0_RXD,
    UART_1_RXD,
    VAREF0,
    // Outputs
    UART_0_TXD,
    UART_1_TXD
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  ADCDirectInput_0;
input  GPIO_0_IN;
input  GPIO_1_IN;
input  MSS_RESET_N;
input  UART_0_RXD;
input  UART_1_RXD;
input  VAREF0;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output UART_0_TXD;
output UART_1_TXD;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   ADCDirectInput_0;
wire   GPIO_0_IN;
wire   GPIO_1_IN;
wire   MSS_RESET_N;
wire   UART_0_RXD;
wire   UART_0_TXD_net_0;
wire   UART_1_RXD;
wire   UART_1_TXD_net_0;
wire   VAREF0;
wire   UART_1_TXD_net_1;
wire   UART_0_TXD_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign UART_1_TXD_net_1 = UART_1_TXD_net_0;
assign UART_1_TXD       = UART_1_TXD_net_1;
assign UART_0_TXD_net_1 = UART_0_TXD_net_0;
assign UART_0_TXD       = UART_0_TXD_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------cariomart_mss
cariomart_mss cariomart_mss_0(
        // Inputs
        .UART_0_RXD       ( UART_0_RXD ),
        .UART_1_RXD       ( UART_1_RXD ),
        .MSS_RESET_N      ( MSS_RESET_N ),
        .ADCDirectInput_0 ( ADCDirectInput_0 ),
        .VAREF0           ( VAREF0 ),
        .GPIO_0_IN        ( GPIO_0_IN ),
        .GPIO_1_IN        ( GPIO_1_IN ),
        // Outputs
        .UART_0_TXD       ( UART_0_TXD_net_0 ),
        .UART_1_TXD       ( UART_1_TXD_net_0 ) 
        );


endmodule
