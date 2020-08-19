// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
    @8192       // 32 * 256 = 8192
    D=A
    @size
    M=D 
(MAIN) 
    @offset
    M=0
    @KBD
    D=M 
    @WHITE
    D;JEQ       // if (KBD == 0) goto WHITE // when no  key is pressed 
(BLACK)     
    @offset
    D=M         // D=offset
    @size
    D=D-M       // D=offset-size 
    @MAIN
    D;JEQ       // if (offset-size) == 0 goto MAIN // finish looping
    @offset
    D=M         // D=offset
    @SCREEN
    A=A+D
    M=-1        // set black 
    @offset
    M=M+1       // increase offset 
    @BLACK
    0;JMP       // jump to BLACK
(WHITE)
    @offset
    D=M         // D=offset 
    @size
    D=D-M       // D=offset-size
    @MAIN 
    D;JEQ       // if (offset-size) == 0 goto MAIN // finish looping 
    @offset 
    D=M         // D=offset
    @SCREEN
    A=A+D
    M=0         // set white 
    @offset
    M=M+1       // increase offset 
    @WHITE
    0;JMP       // jump to WHITE