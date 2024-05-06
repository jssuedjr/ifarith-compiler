# Discussion and Reflection


The bulk of this project consists of a collection of five
questions. You are to answer these questions after spending some
amount of time looking over the code together to gather answers for
your questions. Try to seriously dig into the project together--it is
of course understood that you may not grasp every detail, but put
forth serious effort to spend several hours reading and discussing the
code, along with anything you have taken from it.

Questions will largely be graded on completion and maturity, but the
instructors do reserve the right to take off for technical
inaccuracies (i.e., if you say something factually wrong).

Each of these (six, five main followed by last) questions should take
roughly at least a paragraph or two. Try to aim for between 1-500
words per question. You may divide up the work, but each of you should
collectively read and agree to each other's answers.

[ Question 1 ] 

For this task, you will three new .irv programs. These are
`ir-virtual?` programs in a pseudo-assembly format. Try to compile the
program. Here, you should briefly explain the purpose of ir-virtual,
especially how it is different than x86: what are the pros and cons of
using ir-virtual as a representation? You can get the compiler to to
compile ir-virtual files like so: 

racket compiler.rkt -v test-programs/sum1.irv 

(Also pass in -m for Mac

ANSWER FOR QUESTION 1:
Ir-virtual’s purpose is to be a simpler representation of a program before being converted to assembly, and then machine code. Ir-virtual uses a theoretically infinite amount of virtual registers and the stack (located in the cache) to store variables and when needed, shuffle the variables in and out of the physical registers during instruction execution. It is represented by lists of register instructions. ir-virtual only allows instructions that can involve only registers and literal values. x86 technically also allows for instructions that involve memory addresses to go into memory if needed, so variables don’t always need to be pushed in the stack, however ir-virtual’s method of representation does not support this feature. x86 also has many operations available to manipulate data within registers, while ir-virtual supports only a small subset of these operations, which limits its usability for more complex uses. In practice, there are IR’s that better utilize the features of x86 assembly. However, using ir-virtual as an intermediate representation can be useful due to its simplicity in implementation and translation from ir-virtual to x86. This can result in faster compilation times for programs and, as a consequence, faster running times for programs. The fact that translating from ir-virtual to x86 is simple also means that ir-virtual can be good in scenarios where debugging is crucial, at the cost of being heavily limited by what kind of program you can make. 

[ Question 2 ] 

For this task, you will write three new .ifa programs. Your programs
must be correct, in the sense that they are valid. There are a set of
starter programs in the test-programs directory now. Your job is to
create three new `.ifa` programs and compile and run each of them. It
is very much possible that the compiler will be broken: part of your
exercise is identifying if you can find any possible bugs in the
compiler.

For each of your exercises, write here what the input and output was
from the compiler. Read through each of the phases, by passing in the
`-v` flag to the compiler. For at least one of the programs, explain
carefully the relevance of each of the intermediate representations.

For this question, please add your `.ifa` programs either (a) here or
(b) to the repo and write where they are in this file.

ANSWER FOR QUESTION 2:
Test 1:
Input: 
(let* ([x0 1]
    [x0 (+ 1 24)]
    [x2 (* x0 3)])
      (print x0))

Output: 
25

Relevance of each IR? 
The input goes through several intermediate representations before finally being executed. It goes through the following representations:
Ifarith -> ifarith-tiny

Input source tree in IfArith:
'(let* ((x0 1) (x0 (+ 1 24)) (x2 (* x0 3))) (print x0))
ifarith-tiny:
'(let ((x0 1)) (let ((x0 (+ 1 24))) (let ((x2 (* x0 3))) (print x0))))

	This translation converts let* into a version based on sequences of let, which may be useful for simplifying the input into something more easily translated into machine code. 

Ifarith-tiny -> ANF 

anf:
'(let ((x1254 1))
   (let ((x0 x1254))
     (let ((x1255 1))
       (let ((x1256 24))
         (let ((x1257 (+ x1255 x1256)))
           (let ((x0 x1257))
             (let ((x1258 3))
               (let ((x1259 (* x0 x1258)))
                 (let ((x2 x1259)) (print x0))))))))))

	The conversion between ifarith-tiny and ANF further reduces the language into a simpler form, albeit with more lines. However, this step is necessary to make each instruction executable by sequences of instructions (if needed), and thus represent the input in a manner closer to how a processor would execute code. 
		
ANF -> ir-virtual

ir-virtual:
'(((label lab1260) (mov-lit x1254 1))
  ((label lab1261) (mov-reg x0 x1254))
  ((label lab1262) (mov-lit x1255 1))
  ((label lab1263) (mov-lit x1256 24))
  ((label lab1264) (mov-reg x1257 x1255))
  (add x1257 x1256)
  ((label lab1265) (mov-reg x0 x1257))
  ((label lab1266) (mov-lit x1258 3))
  ((label lab1267) (mov-reg x1259 x0))
  (imul x1259 x1258)
  ((label lab1268) (mov-reg x2 x1259))
  ((label lab1269) (print x0))
  (return 0))

	ir-virtual’s representation is useful because it is close to what actual assembly would look like. The previous translation to ANF should make the translation to ir-virtual easier than if it was from ifarith-tiny -> ir-virtual.  


Ir-virtual -> x86

section .data
	int_format db "%ld",10,0
	global _main
	extern _printf
section .text
_start:	call _main
	mov rax, 60
	xor rdi, rdi
	syscall
_main:	push rbp
	mov rbp, rsp
	sub rsp, 128
	mov esi, 1
	mov [rbp-8], esi
	mov esi, [rbp-8]
	mov [rbp-40], esi
	mov esi, 1
	mov [rbp-32], esi
	mov esi, 24
	mov [rbp-24], esi
	mov esi, [rbp-32]
	mov [rbp-64], esi
	mov edi, [rbp-24]
	mov eax, [rbp-64]
	add eax, edi
	mov [rbp-64], eax
	mov esi, [rbp-64]
	mov [rbp-40], esi
	mov esi, 3
	mov [rbp-56], esi
	mov esi, [rbp-40]
	mov [rbp-48], esi
	mov edi, [rbp-56]
	mov eax, [rbp-48]
	imul eax, edi
	mov [rbp-48], eax
	mov esi, [rbp-48]
	mov [rbp-16], esi
	mov esi, [rbp-40]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
finish_up:	add rsp, 128
	leave 
	ret 

The final representation to x86 assembly is important to have code that can be executed. This conversion should be simpler, due to the similarities between x86 and ir-virtual.

Test 2:
	Input:
(cond [3 (print 1)]
      	    [(+ 2 3) (print 2)]
      	    [(* 5 (+ 2 -2)) (let* ([x 1]) (print (+ x 1)))]
      	    [else (print 4)])

	Output:
	2

Test 3: 
	Input:
(let* ([x 2]
       	    [y 10]
                [z 3]
       	    [a 0])
  	 (if y
    	 (let* ([x0 1]
    	    [x0 (+ 1 24)]
    	    [x2 (* x0 3)])
      	    (print x0))
    	(print z)))

	Output: 3



[ Question 3 ] 

Describe each of the passes of the compiler in a slight degree of
detail, using specific examples to discuss what each pass does. The
compiler is designed in series of layers, with each higher-level IR
desugaring to a lower-level IR until ultimately arriving at x86-64
assembler. Do you think there are any redundant passes? Do you think
there could be more?

In answering this question, you must use specific examples that you
got from running the compiler and generating an output.

ANSWER FOR QUESTION 3:
Translating from ifarith to ifarith-tiny reduces ifarith to use less forms and to rewrite certain parts of the language in different ways that could be simpler for the computer to execute. For example, let* in ifarith is instead represented by sequences of lets:

Input source tree in IfArith:
'(let* ((x0 1)) (let* ((x1 (+ x0 30))) (let* ((x2 (* x0 x1))) (print x2))))
ifarith-tiny:
'(let ((x0 1)) (let ((x1 (+ x0 30))) (let ((x2 (* x0 x1))) (print x2))))

 Both ways represent the same action, however, ifarith-tiny’s representation might be simpler to rewrite in a lower level language than ifarith’s version. Secondly, the and/or boolean operators are represented in ifarith-tiny by using if statements. The cond function is also represented by using if:

Input source tree in IfArith:
'(cond
  ((- 5 (* 2 3)) (print 1))
  ((+ 2 3) (print 2))
  ((* 5 (+ 2 -2)) (print 3))
  (else (print 4)))
ifarith-tiny:
'(if (- 5 (* 2 3))
   (print 1)
   (if (+ 2 3) (print 2) (if (* 5 (+ 2 -2)) (print 3) (print 4))))

 The conversion from ifarith-tiny to ANF helps to further reduce the representation to one that is easier to translate to the final form (NASM). ANF’s representation results in simpler to write instructions that can be translated to assembly to be able to execute the whole instruction one operation at a time:

ifarith-tiny:
'(print (+ 3 (* 1 4)))
anf:
'(let ((x1254 3))
   (let ((x1255 1))
     (let ((x1256 4))
       (let ((x1257 (* x1255 x1256)))
         (let ((x1258 (+ x1254 x1257))) (print x1258))))))

 The translation from ANF to ir-virtual is simpler now because of ANF’s representation simplifying the instructions into series of steps. Ir-virtual does not have many forms which should help in compilation. Because the output is a list of register-based instructions that are pushed on the stack, this representation is useful to capture the basic instructions that need to be done sequentially to execute a program, before translation to assembly. 

Input source tree in IfArith:
'(print (* 5 3))
anf:
'(let ((x1254 5))
   (let ((x1255 3)) (let ((x1256 (* x1254 x1255))) (print x1256))))
ir-virtual:
'(((label lab1257) (mov-lit x1254 5))
  ((label lab1258) (mov-lit x1255 3))
  ((label lab1259) (mov-reg x1256 x1254))
  (imul x1256 x1255)
  ((label lab1260) (print x1256))
  (return 0))

The translation from ir-virtual to x86 is simpler up to this point because of the several transformations the original input has gone through. Before being translated to machine code, the code must be translated into assembly. All the virtual registers are allocated to the stack, and the data located in the stack is swapped in and out of physical registers to compute instructions. The purpose of the translation from x86 to NASM is to make the x86 assembly able to be compiled on Linux or other UNIX-based systems.

Input source tree in IfArith:
'(print 1)
ir-virtual:
'(((label lab1255) (mov-lit x1254 1))
  ((label lab1256) (print x1254))
  (return 0))
x86:
section .data
	int_format db "%ld",10,0
	global _main
	extern _printf
section .text
_start:	call _main
	mov rax, 60
	xor rdi, rdi
	syscall
_main:	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov esi, 1
	mov [rbp-8], esi
	mov esi, [rbp-8]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
finish_up:	add rsp, 16
	leave 
	ret 

It is not easy to determine if there are passes between different intermediate 
representations that are redundant. If the loss of time and usage of memory translating from ifarith to ifarith-tiny were relatively negligible, then the compilation wouldn’t be that much faster without the first phase of translation. However, if compilation started from ifarith-tiny and resulted in faster compilation times, then the first phase could be considered redundant. The benefit of abstracting some of ifarith’s forms, such as and/or and cond, is that it makes it easier to write programs. Using ifarith-tiny to write the same code written in ifarith could prove more difficult or less efficient. The amount of phases the input goes through seems reasonable and adding more stages of translation may be redundant. 



[ Question 4 ] 

This is a larger project, compared to our previous projects. This
project uses a large combination of idioms: tail recursion, folds,
etc.. Discuss a few programming idioms that you can identify in the
project that we discussed in class this semester. There is no specific
definition of what an idiom is: think carefully about whether you see
any pattern in this code that resonates with you from earlier in the
semester.

ANSWER FOR QUESTION 4:

One idiom that we identified in the project that we discussed in class is pattern matching. This can be seen in functions such as ifarith? and ifarith-tiny?. For example, pattern matching is used in ifarith? and ifarith-tiny? to evaluate the expression and check each pattern in the pattern matching to the expression. These patterns are checked in order. By defining both functions in this way, both languages are able to be clearly defined based on what available patterns there are to match to. Another idiom we identified is recursion. One example of recursion in this code is in the function ifarith-tiny->anf. First instance in this function in the if statement. It calls the normalize-name function, a function we defined earlier in ifarith-tiny->anf. Most of the recursion in the code uses tail recursion in order to accumulate the final output in a way that does not add more work to the stack. 


[ Question 5 ] 

In this question, you will play the role of bug finder. I would like
you to be creative, adversarial, and exploratory. Spend an hour or two
looking throughout the code and try to break it. Try to see if you can
identify a buggy program: a program that should work, but does
not. This could either be that the compiler crashes, or it could be
that it produces code which will not assemble. Last, even if the code
assembles and links, its behavior could be incorrect.

To answer this question, I want you to summarize your discussion,
experiences, and findings by adversarily breaking the compiler. If
there is something you think should work (but does not), feel free to
ask me.

Your team will receive a small bonus for being the first team to
report a unique bug (unique determined by me).

ANSWER FOR QUESTION 5:
In ifarith-tiny?, the type predicate should call ifarith-tiny? but calls the previous function, ifarith?. We found this error while discussing in office hours how our compiler was not running correctly when trying to run programs involving let*. We examined both ifarith? and ifarith-tiny? and followed the code to see how it worked. We came across ifarith? instead of ifarith-tiny? and replaced it.Furthermore, booleans were a part of the possible types in ifarith and ifarith-tiny, however the compiler could not interpret them correctly for some of the test programs. 

[ High Level Reflection ] 

In roughly 100-500 words, write a summary of your findings in working
on this project: what did you learn, what did you find interesting,
what did you find challenging? As you progress in your career, it will
be increasingly important to have technical conversations about the
nuts and bolts of code, try to use this experience as a way to think
about how you would approach doing group code critique. What would you
do differently next time, what did you learn?

REFLECTION ANSWER:
The project was a good experience for working together as a team to analyze and try to understand the inner workings of complex code. Being able to test code and try to look for bugs was also an interesting part of the project. The most interesting part of the project was the process of compilation happening in the racket program. It’s interesting to see how all the intermediate representations worked together to finally create assembly code that could compile and run!

