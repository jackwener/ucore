
bin/kernel：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
void kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

void
kern_init(void){
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 18             	sub    $0x18,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 80 fe 10 00       	mov    $0x10fe80,%edx
  10000b:	b8 56 ea 10 00       	mov    $0x10ea56,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	83 ec 04             	sub    $0x4,%esp
  100017:	50                   	push   %eax
  100018:	6a 00                	push   $0x0
  10001a:	68 56 ea 10 00       	push   $0x10ea56
  10001f:	e8 44 2d 00 00       	call   102d68 <memset>
  100024:	83 c4 10             	add    $0x10,%esp

    cons_init();                // init the console
  100027:	e8 06 15 00 00       	call   101532 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  10002c:	c7 45 f4 00 35 10 00 	movl   $0x103500,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100033:	83 ec 08             	sub    $0x8,%esp
  100036:	ff 75 f4             	pushl  -0xc(%ebp)
  100039:	68 1c 35 10 00       	push   $0x10351c
  10003e:	e8 01 02 00 00       	call   100244 <cprintf>
  100043:	83 c4 10             	add    $0x10,%esp

    print_kerninfo();
  100046:	e8 7f 08 00 00       	call   1008ca <print_kerninfo>

    grade_backtrace();
  10004b:	e8 76 00 00 00       	call   1000c6 <grade_backtrace>

    pmm_init();                 // init physical memory management
  100050:	e8 d8 29 00 00       	call   102a2d <pmm_init>

    pic_init();                 // init interrupt controller
  100055:	e8 17 16 00 00       	call   101671 <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005a:	e8 74 17 00 00       	call   1017d3 <idt_init>

    clock_init();               // init clock interrupt
  10005f:	e8 c4 0c 00 00       	call   100d28 <clock_init>
    intr_enable();              // enable irq interrupt
  100064:	e8 44 17 00 00       	call   1017ad <intr_enable>

    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    lab1_switch_test();
  100069:	e8 49 01 00 00       	call   1001b7 <lab1_switch_test>

    /* do nothing */
    while (1);
  10006e:	eb fe                	jmp    10006e <kern_init+0x6e>

00100070 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100070:	55                   	push   %ebp
  100071:	89 e5                	mov    %esp,%ebp
  100073:	83 ec 08             	sub    $0x8,%esp
    mon_backtrace(0, NULL, NULL);
  100076:	83 ec 04             	sub    $0x4,%esp
  100079:	6a 00                	push   $0x0
  10007b:	6a 00                	push   $0x0
  10007d:	6a 00                	push   $0x0
  10007f:	e8 92 0c 00 00       	call   100d16 <mon_backtrace>
  100084:	83 c4 10             	add    $0x10,%esp
}
  100087:	c9                   	leave  
  100088:	c3                   	ret    

00100089 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100089:	55                   	push   %ebp
  10008a:	89 e5                	mov    %esp,%ebp
  10008c:	53                   	push   %ebx
  10008d:	83 ec 04             	sub    $0x4,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  100090:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  100093:	8b 55 0c             	mov    0xc(%ebp),%edx
  100096:	8d 5d 08             	lea    0x8(%ebp),%ebx
  100099:	8b 45 08             	mov    0x8(%ebp),%eax
  10009c:	51                   	push   %ecx
  10009d:	52                   	push   %edx
  10009e:	53                   	push   %ebx
  10009f:	50                   	push   %eax
  1000a0:	e8 cb ff ff ff       	call   100070 <grade_backtrace2>
  1000a5:	83 c4 10             	add    $0x10,%esp
}
  1000a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000ab:	c9                   	leave  
  1000ac:	c3                   	ret    

001000ad <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000ad:	55                   	push   %ebp
  1000ae:	89 e5                	mov    %esp,%ebp
  1000b0:	83 ec 08             	sub    $0x8,%esp
    grade_backtrace1(arg0, arg2);
  1000b3:	83 ec 08             	sub    $0x8,%esp
  1000b6:	ff 75 10             	pushl  0x10(%ebp)
  1000b9:	ff 75 08             	pushl  0x8(%ebp)
  1000bc:	e8 c8 ff ff ff       	call   100089 <grade_backtrace1>
  1000c1:	83 c4 10             	add    $0x10,%esp
}
  1000c4:	c9                   	leave  
  1000c5:	c3                   	ret    

001000c6 <grade_backtrace>:

void
grade_backtrace(void) {
  1000c6:	55                   	push   %ebp
  1000c7:	89 e5                	mov    %esp,%ebp
  1000c9:	83 ec 08             	sub    $0x8,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000cc:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000d1:	83 ec 04             	sub    $0x4,%esp
  1000d4:	68 00 00 ff ff       	push   $0xffff0000
  1000d9:	50                   	push   %eax
  1000da:	6a 00                	push   $0x0
  1000dc:	e8 cc ff ff ff       	call   1000ad <grade_backtrace0>
  1000e1:	83 c4 10             	add    $0x10,%esp
}
  1000e4:	c9                   	leave  
  1000e5:	c3                   	ret    

001000e6 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  1000e6:	55                   	push   %ebp
  1000e7:	89 e5                	mov    %esp,%ebp
  1000e9:	83 ec 18             	sub    $0x18,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  1000ec:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  1000ef:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  1000f2:	8c 45 f2             	mov    %es,-0xe(%ebp)
  1000f5:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  1000f8:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  1000fc:	0f b7 c0             	movzwl %ax,%eax
  1000ff:	83 e0 03             	and    $0x3,%eax
  100102:	89 c2                	mov    %eax,%edx
  100104:	a1 80 ea 10 00       	mov    0x10ea80,%eax
  100109:	83 ec 04             	sub    $0x4,%esp
  10010c:	52                   	push   %edx
  10010d:	50                   	push   %eax
  10010e:	68 21 35 10 00       	push   $0x103521
  100113:	e8 2c 01 00 00       	call   100244 <cprintf>
  100118:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  cs = %x\n", round, reg1);
  10011b:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10011f:	0f b7 d0             	movzwl %ax,%edx
  100122:	a1 80 ea 10 00       	mov    0x10ea80,%eax
  100127:	83 ec 04             	sub    $0x4,%esp
  10012a:	52                   	push   %edx
  10012b:	50                   	push   %eax
  10012c:	68 2f 35 10 00       	push   $0x10352f
  100131:	e8 0e 01 00 00       	call   100244 <cprintf>
  100136:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ds = %x\n", round, reg2);
  100139:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10013d:	0f b7 d0             	movzwl %ax,%edx
  100140:	a1 80 ea 10 00       	mov    0x10ea80,%eax
  100145:	83 ec 04             	sub    $0x4,%esp
  100148:	52                   	push   %edx
  100149:	50                   	push   %eax
  10014a:	68 3d 35 10 00       	push   $0x10353d
  10014f:	e8 f0 00 00 00       	call   100244 <cprintf>
  100154:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  es = %x\n", round, reg3);
  100157:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10015b:	0f b7 d0             	movzwl %ax,%edx
  10015e:	a1 80 ea 10 00       	mov    0x10ea80,%eax
  100163:	83 ec 04             	sub    $0x4,%esp
  100166:	52                   	push   %edx
  100167:	50                   	push   %eax
  100168:	68 4b 35 10 00       	push   $0x10354b
  10016d:	e8 d2 00 00 00       	call   100244 <cprintf>
  100172:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ss = %x\n", round, reg4);
  100175:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  100179:	0f b7 d0             	movzwl %ax,%edx
  10017c:	a1 80 ea 10 00       	mov    0x10ea80,%eax
  100181:	83 ec 04             	sub    $0x4,%esp
  100184:	52                   	push   %edx
  100185:	50                   	push   %eax
  100186:	68 59 35 10 00       	push   $0x103559
  10018b:	e8 b4 00 00 00       	call   100244 <cprintf>
  100190:	83 c4 10             	add    $0x10,%esp
    round ++;
  100193:	a1 80 ea 10 00       	mov    0x10ea80,%eax
  100198:	83 c0 01             	add    $0x1,%eax
  10019b:	a3 80 ea 10 00       	mov    %eax,0x10ea80
}
  1001a0:	c9                   	leave  
  1001a1:	c3                   	ret    

001001a2 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001a2:	55                   	push   %ebp
  1001a3:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
	asm volatile (
  1001a5:	83 ec 08             	sub    $0x8,%esp
  1001a8:	cd 78                	int    $0x78
  1001aa:	89 ec                	mov    %ebp,%esp
	    "int %0 \n"
	    "movl %%ebp, %%esp"
	    : 
	    : "i"(T_SWITCH_TOU)
	);
}
  1001ac:	5d                   	pop    %ebp
  1001ad:	c3                   	ret    

001001ae <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001ae:	55                   	push   %ebp
  1001af:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
	asm volatile (
  1001b1:	cd 79                	int    $0x79
  1001b3:	89 ec                	mov    %ebp,%esp
	    "int %0 \n"
	    "movl %%ebp, %%esp \n"
	    : 
	    : "i"(T_SWITCH_TOK)
	);
}
  1001b5:	5d                   	pop    %ebp
  1001b6:	c3                   	ret    

001001b7 <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001b7:	55                   	push   %ebp
  1001b8:	89 e5                	mov    %esp,%ebp
  1001ba:	83 ec 08             	sub    $0x8,%esp
    lab1_print_cur_status();
  1001bd:	e8 24 ff ff ff       	call   1000e6 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001c2:	83 ec 0c             	sub    $0xc,%esp
  1001c5:	68 68 35 10 00       	push   $0x103568
  1001ca:	e8 75 00 00 00       	call   100244 <cprintf>
  1001cf:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_user();
  1001d2:	e8 cb ff ff ff       	call   1001a2 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001d7:	e8 0a ff ff ff       	call   1000e6 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001dc:	83 ec 0c             	sub    $0xc,%esp
  1001df:	68 88 35 10 00       	push   $0x103588
  1001e4:	e8 5b 00 00 00       	call   100244 <cprintf>
  1001e9:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_kernel();
  1001ec:	e8 bd ff ff ff       	call   1001ae <lab1_switch_to_kernel>
    lab1_print_cur_status();
  1001f1:	e8 f0 fe ff ff       	call   1000e6 <lab1_print_cur_status>
}
  1001f6:	c9                   	leave  
  1001f7:	c3                   	ret    

001001f8 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1001f8:	55                   	push   %ebp
  1001f9:	89 e5                	mov    %esp,%ebp
  1001fb:	83 ec 08             	sub    $0x8,%esp
    cons_putc(c);
  1001fe:	83 ec 0c             	sub    $0xc,%esp
  100201:	ff 75 08             	pushl  0x8(%ebp)
  100204:	e8 59 13 00 00       	call   101562 <cons_putc>
  100209:	83 c4 10             	add    $0x10,%esp
    (*cnt) ++;
  10020c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10020f:	8b 00                	mov    (%eax),%eax
  100211:	8d 50 01             	lea    0x1(%eax),%edx
  100214:	8b 45 0c             	mov    0xc(%ebp),%eax
  100217:	89 10                	mov    %edx,(%eax)
}
  100219:	c9                   	leave  
  10021a:	c3                   	ret    

0010021b <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  10021b:	55                   	push   %ebp
  10021c:	89 e5                	mov    %esp,%ebp
  10021e:	83 ec 18             	sub    $0x18,%esp
    int cnt = 0;
  100221:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  100228:	ff 75 0c             	pushl  0xc(%ebp)
  10022b:	ff 75 08             	pushl  0x8(%ebp)
  10022e:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100231:	50                   	push   %eax
  100232:	68 f8 01 10 00       	push   $0x1001f8
  100237:	e8 60 2e 00 00       	call   10309c <vprintfmt>
  10023c:	83 c4 10             	add    $0x10,%esp
    return cnt;
  10023f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100242:	c9                   	leave  
  100243:	c3                   	ret    

00100244 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100244:	55                   	push   %ebp
  100245:	89 e5                	mov    %esp,%ebp
  100247:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10024a:	8d 45 0c             	lea    0xc(%ebp),%eax
  10024d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100250:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100253:	83 ec 08             	sub    $0x8,%esp
  100256:	50                   	push   %eax
  100257:	ff 75 08             	pushl  0x8(%ebp)
  10025a:	e8 bc ff ff ff       	call   10021b <vcprintf>
  10025f:	83 c4 10             	add    $0x10,%esp
  100262:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  100265:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100268:	c9                   	leave  
  100269:	c3                   	ret    

0010026a <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  10026a:	55                   	push   %ebp
  10026b:	89 e5                	mov    %esp,%ebp
  10026d:	83 ec 08             	sub    $0x8,%esp
    cons_putc(c);
  100270:	83 ec 0c             	sub    $0xc,%esp
  100273:	ff 75 08             	pushl  0x8(%ebp)
  100276:	e8 e7 12 00 00       	call   101562 <cons_putc>
  10027b:	83 c4 10             	add    $0x10,%esp
}
  10027e:	c9                   	leave  
  10027f:	c3                   	ret    

00100280 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  100280:	55                   	push   %ebp
  100281:	89 e5                	mov    %esp,%ebp
  100283:	83 ec 18             	sub    $0x18,%esp
    int cnt = 0;
  100286:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  10028d:	eb 14                	jmp    1002a3 <cputs+0x23>
        cputch(c, &cnt);
  10028f:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  100293:	83 ec 08             	sub    $0x8,%esp
  100296:	8d 55 f0             	lea    -0x10(%ebp),%edx
  100299:	52                   	push   %edx
  10029a:	50                   	push   %eax
  10029b:	e8 58 ff ff ff       	call   1001f8 <cputch>
  1002a0:	83 c4 10             	add    $0x10,%esp
    while ((c = *str ++) != '\0') {
  1002a3:	8b 45 08             	mov    0x8(%ebp),%eax
  1002a6:	8d 50 01             	lea    0x1(%eax),%edx
  1002a9:	89 55 08             	mov    %edx,0x8(%ebp)
  1002ac:	0f b6 00             	movzbl (%eax),%eax
  1002af:	88 45 f7             	mov    %al,-0x9(%ebp)
  1002b2:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1002b6:	75 d7                	jne    10028f <cputs+0xf>
    }
    cputch('\n', &cnt);
  1002b8:	83 ec 08             	sub    $0x8,%esp
  1002bb:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1002be:	50                   	push   %eax
  1002bf:	6a 0a                	push   $0xa
  1002c1:	e8 32 ff ff ff       	call   1001f8 <cputch>
  1002c6:	83 c4 10             	add    $0x10,%esp
    return cnt;
  1002c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1002cc:	c9                   	leave  
  1002cd:	c3                   	ret    

001002ce <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1002ce:	55                   	push   %ebp
  1002cf:	89 e5                	mov    %esp,%ebp
  1002d1:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1002d4:	e8 b8 12 00 00       	call   101591 <cons_getc>
  1002d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1002dc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1002e0:	74 f2                	je     1002d4 <getchar+0x6>
        /* do nothing */;
    return c;
  1002e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1002e5:	c9                   	leave  
  1002e6:	c3                   	ret    

001002e7 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  1002e7:	55                   	push   %ebp
  1002e8:	89 e5                	mov    %esp,%ebp
  1002ea:	83 ec 18             	sub    $0x18,%esp
    if (prompt != NULL) {
  1002ed:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1002f1:	74 13                	je     100306 <readline+0x1f>
        cprintf("%s", prompt);
  1002f3:	83 ec 08             	sub    $0x8,%esp
  1002f6:	ff 75 08             	pushl  0x8(%ebp)
  1002f9:	68 a7 35 10 00       	push   $0x1035a7
  1002fe:	e8 41 ff ff ff       	call   100244 <cprintf>
  100303:	83 c4 10             	add    $0x10,%esp
    }
    int i = 0, c;
  100306:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  10030d:	e8 bc ff ff ff       	call   1002ce <getchar>
  100312:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100315:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100319:	79 0a                	jns    100325 <readline+0x3e>
            return NULL;
  10031b:	b8 00 00 00 00       	mov    $0x0,%eax
  100320:	e9 82 00 00 00       	jmp    1003a7 <readline+0xc0>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100325:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100329:	7e 2b                	jle    100356 <readline+0x6f>
  10032b:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100332:	7f 22                	jg     100356 <readline+0x6f>
            cputchar(c);
  100334:	83 ec 0c             	sub    $0xc,%esp
  100337:	ff 75 f0             	pushl  -0x10(%ebp)
  10033a:	e8 2b ff ff ff       	call   10026a <cputchar>
  10033f:	83 c4 10             	add    $0x10,%esp
            buf[i ++] = c;
  100342:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100345:	8d 50 01             	lea    0x1(%eax),%edx
  100348:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10034b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10034e:	88 90 c0 ea 10 00    	mov    %dl,0x10eac0(%eax)
  100354:	eb 4c                	jmp    1003a2 <readline+0xbb>
        }
        else if (c == '\b' && i > 0) {
  100356:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  10035a:	75 1a                	jne    100376 <readline+0x8f>
  10035c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100360:	7e 14                	jle    100376 <readline+0x8f>
            cputchar(c);
  100362:	83 ec 0c             	sub    $0xc,%esp
  100365:	ff 75 f0             	pushl  -0x10(%ebp)
  100368:	e8 fd fe ff ff       	call   10026a <cputchar>
  10036d:	83 c4 10             	add    $0x10,%esp
            i --;
  100370:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  100374:	eb 2c                	jmp    1003a2 <readline+0xbb>
        }
        else if (c == '\n' || c == '\r') {
  100376:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  10037a:	74 06                	je     100382 <readline+0x9b>
  10037c:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  100380:	75 20                	jne    1003a2 <readline+0xbb>
            cputchar(c);
  100382:	83 ec 0c             	sub    $0xc,%esp
  100385:	ff 75 f0             	pushl  -0x10(%ebp)
  100388:	e8 dd fe ff ff       	call   10026a <cputchar>
  10038d:	83 c4 10             	add    $0x10,%esp
            buf[i] = '\0';
  100390:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100393:	05 c0 ea 10 00       	add    $0x10eac0,%eax
  100398:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  10039b:	b8 c0 ea 10 00       	mov    $0x10eac0,%eax
  1003a0:	eb 05                	jmp    1003a7 <readline+0xc0>
        }
    }
  1003a2:	e9 66 ff ff ff       	jmp    10030d <readline+0x26>
}
  1003a7:	c9                   	leave  
  1003a8:	c3                   	ret    

001003a9 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1003a9:	55                   	push   %ebp
  1003aa:	89 e5                	mov    %esp,%ebp
  1003ac:	83 ec 18             	sub    $0x18,%esp
    if (is_panic) {
  1003af:	a1 c0 ee 10 00       	mov    0x10eec0,%eax
  1003b4:	85 c0                	test   %eax,%eax
  1003b6:	74 02                	je     1003ba <__panic+0x11>
        goto panic_dead;
  1003b8:	eb 48                	jmp    100402 <__panic+0x59>
    }
    is_panic = 1;
  1003ba:	c7 05 c0 ee 10 00 01 	movl   $0x1,0x10eec0
  1003c1:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  1003c4:	8d 45 14             	lea    0x14(%ebp),%eax
  1003c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  1003ca:	83 ec 04             	sub    $0x4,%esp
  1003cd:	ff 75 0c             	pushl  0xc(%ebp)
  1003d0:	ff 75 08             	pushl  0x8(%ebp)
  1003d3:	68 aa 35 10 00       	push   $0x1035aa
  1003d8:	e8 67 fe ff ff       	call   100244 <cprintf>
  1003dd:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  1003e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003e3:	83 ec 08             	sub    $0x8,%esp
  1003e6:	50                   	push   %eax
  1003e7:	ff 75 10             	pushl  0x10(%ebp)
  1003ea:	e8 2c fe ff ff       	call   10021b <vcprintf>
  1003ef:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  1003f2:	83 ec 0c             	sub    $0xc,%esp
  1003f5:	68 c6 35 10 00       	push   $0x1035c6
  1003fa:	e8 45 fe ff ff       	call   100244 <cprintf>
  1003ff:	83 c4 10             	add    $0x10,%esp
    va_end(ap);

panic_dead:
    intr_disable();
  100402:	e8 ac 13 00 00       	call   1017b3 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100407:	83 ec 0c             	sub    $0xc,%esp
  10040a:	6a 00                	push   $0x0
  10040c:	e8 2a 08 00 00       	call   100c3b <kmonitor>
  100411:	83 c4 10             	add    $0x10,%esp
    }
  100414:	eb f1                	jmp    100407 <__panic+0x5e>

00100416 <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100416:	55                   	push   %ebp
  100417:	89 e5                	mov    %esp,%ebp
  100419:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    va_start(ap, fmt);
  10041c:	8d 45 14             	lea    0x14(%ebp),%eax
  10041f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100422:	83 ec 04             	sub    $0x4,%esp
  100425:	ff 75 0c             	pushl  0xc(%ebp)
  100428:	ff 75 08             	pushl  0x8(%ebp)
  10042b:	68 c8 35 10 00       	push   $0x1035c8
  100430:	e8 0f fe ff ff       	call   100244 <cprintf>
  100435:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  100438:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10043b:	83 ec 08             	sub    $0x8,%esp
  10043e:	50                   	push   %eax
  10043f:	ff 75 10             	pushl  0x10(%ebp)
  100442:	e8 d4 fd ff ff       	call   10021b <vcprintf>
  100447:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  10044a:	83 ec 0c             	sub    $0xc,%esp
  10044d:	68 c6 35 10 00       	push   $0x1035c6
  100452:	e8 ed fd ff ff       	call   100244 <cprintf>
  100457:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  10045a:	c9                   	leave  
  10045b:	c3                   	ret    

0010045c <is_kernel_panic>:

bool
is_kernel_panic(void) {
  10045c:	55                   	push   %ebp
  10045d:	89 e5                	mov    %esp,%ebp
    return is_panic;
  10045f:	a1 c0 ee 10 00       	mov    0x10eec0,%eax
}
  100464:	5d                   	pop    %ebp
  100465:	c3                   	ret    

00100466 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  100466:	55                   	push   %ebp
  100467:	89 e5                	mov    %esp,%ebp
  100469:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  10046c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10046f:	8b 00                	mov    (%eax),%eax
  100471:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100474:	8b 45 10             	mov    0x10(%ebp),%eax
  100477:	8b 00                	mov    (%eax),%eax
  100479:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10047c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  100483:	e9 d2 00 00 00       	jmp    10055a <stab_binsearch+0xf4>
        int true_m = (l + r) / 2, m = true_m;
  100488:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10048b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10048e:	01 d0                	add    %edx,%eax
  100490:	89 c2                	mov    %eax,%edx
  100492:	c1 ea 1f             	shr    $0x1f,%edx
  100495:	01 d0                	add    %edx,%eax
  100497:	d1 f8                	sar    %eax
  100499:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10049c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10049f:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1004a2:	eb 04                	jmp    1004a8 <stab_binsearch+0x42>
            m --;
  1004a4:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  1004a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004ab:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004ae:	7c 1f                	jl     1004cf <stab_binsearch+0x69>
  1004b0:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004b3:	89 d0                	mov    %edx,%eax
  1004b5:	01 c0                	add    %eax,%eax
  1004b7:	01 d0                	add    %edx,%eax
  1004b9:	c1 e0 02             	shl    $0x2,%eax
  1004bc:	89 c2                	mov    %eax,%edx
  1004be:	8b 45 08             	mov    0x8(%ebp),%eax
  1004c1:	01 d0                	add    %edx,%eax
  1004c3:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004c7:	0f b6 c0             	movzbl %al,%eax
  1004ca:	3b 45 14             	cmp    0x14(%ebp),%eax
  1004cd:	75 d5                	jne    1004a4 <stab_binsearch+0x3e>
        }
        if (m < l) {    // no match in [l, m]
  1004cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004d2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004d5:	7d 0b                	jge    1004e2 <stab_binsearch+0x7c>
            l = true_m + 1;
  1004d7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004da:	83 c0 01             	add    $0x1,%eax
  1004dd:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  1004e0:	eb 78                	jmp    10055a <stab_binsearch+0xf4>
        }

        // actual binary search
        any_matches = 1;
  1004e2:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  1004e9:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004ec:	89 d0                	mov    %edx,%eax
  1004ee:	01 c0                	add    %eax,%eax
  1004f0:	01 d0                	add    %edx,%eax
  1004f2:	c1 e0 02             	shl    $0x2,%eax
  1004f5:	89 c2                	mov    %eax,%edx
  1004f7:	8b 45 08             	mov    0x8(%ebp),%eax
  1004fa:	01 d0                	add    %edx,%eax
  1004fc:	8b 40 08             	mov    0x8(%eax),%eax
  1004ff:	3b 45 18             	cmp    0x18(%ebp),%eax
  100502:	73 13                	jae    100517 <stab_binsearch+0xb1>
            *region_left = m;
  100504:	8b 45 0c             	mov    0xc(%ebp),%eax
  100507:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10050a:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  10050c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10050f:	83 c0 01             	add    $0x1,%eax
  100512:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100515:	eb 43                	jmp    10055a <stab_binsearch+0xf4>
        } else if (stabs[m].n_value > addr) {
  100517:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10051a:	89 d0                	mov    %edx,%eax
  10051c:	01 c0                	add    %eax,%eax
  10051e:	01 d0                	add    %edx,%eax
  100520:	c1 e0 02             	shl    $0x2,%eax
  100523:	89 c2                	mov    %eax,%edx
  100525:	8b 45 08             	mov    0x8(%ebp),%eax
  100528:	01 d0                	add    %edx,%eax
  10052a:	8b 40 08             	mov    0x8(%eax),%eax
  10052d:	3b 45 18             	cmp    0x18(%ebp),%eax
  100530:	76 16                	jbe    100548 <stab_binsearch+0xe2>
            *region_right = m - 1;
  100532:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100535:	8d 50 ff             	lea    -0x1(%eax),%edx
  100538:	8b 45 10             	mov    0x10(%ebp),%eax
  10053b:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  10053d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100540:	83 e8 01             	sub    $0x1,%eax
  100543:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100546:	eb 12                	jmp    10055a <stab_binsearch+0xf4>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  100548:	8b 45 0c             	mov    0xc(%ebp),%eax
  10054b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10054e:	89 10                	mov    %edx,(%eax)
            l = m;
  100550:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100553:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  100556:	83 45 18 01          	addl   $0x1,0x18(%ebp)
    while (l <= r) {
  10055a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10055d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  100560:	0f 8e 22 ff ff ff    	jle    100488 <stab_binsearch+0x22>
        }
    }

    if (!any_matches) {
  100566:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10056a:	75 0f                	jne    10057b <stab_binsearch+0x115>
        *region_right = *region_left - 1;
  10056c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10056f:	8b 00                	mov    (%eax),%eax
  100571:	8d 50 ff             	lea    -0x1(%eax),%edx
  100574:	8b 45 10             	mov    0x10(%ebp),%eax
  100577:	89 10                	mov    %edx,(%eax)
  100579:	eb 3f                	jmp    1005ba <stab_binsearch+0x154>
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  10057b:	8b 45 10             	mov    0x10(%ebp),%eax
  10057e:	8b 00                	mov    (%eax),%eax
  100580:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  100583:	eb 04                	jmp    100589 <stab_binsearch+0x123>
  100585:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  100589:	8b 45 0c             	mov    0xc(%ebp),%eax
  10058c:	8b 00                	mov    (%eax),%eax
  10058e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100591:	7d 1f                	jge    1005b2 <stab_binsearch+0x14c>
  100593:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100596:	89 d0                	mov    %edx,%eax
  100598:	01 c0                	add    %eax,%eax
  10059a:	01 d0                	add    %edx,%eax
  10059c:	c1 e0 02             	shl    $0x2,%eax
  10059f:	89 c2                	mov    %eax,%edx
  1005a1:	8b 45 08             	mov    0x8(%ebp),%eax
  1005a4:	01 d0                	add    %edx,%eax
  1005a6:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1005aa:	0f b6 c0             	movzbl %al,%eax
  1005ad:	3b 45 14             	cmp    0x14(%ebp),%eax
  1005b0:	75 d3                	jne    100585 <stab_binsearch+0x11f>
            /* do nothing */;
        *region_left = l;
  1005b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005b5:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005b8:	89 10                	mov    %edx,(%eax)
    }
}
  1005ba:	c9                   	leave  
  1005bb:	c3                   	ret    

001005bc <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  1005bc:	55                   	push   %ebp
  1005bd:	89 e5                	mov    %esp,%ebp
  1005bf:	83 ec 38             	sub    $0x38,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  1005c2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005c5:	c7 00 e8 35 10 00    	movl   $0x1035e8,(%eax)
    info->eip_line = 0;
  1005cb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005ce:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  1005d5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005d8:	c7 40 08 e8 35 10 00 	movl   $0x1035e8,0x8(%eax)
    info->eip_fn_namelen = 9;
  1005df:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005e2:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  1005e9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005ec:	8b 55 08             	mov    0x8(%ebp),%edx
  1005ef:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  1005f2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005f5:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  1005fc:	c7 45 f4 4c 3e 10 00 	movl   $0x103e4c,-0xc(%ebp)
    stab_end = __STAB_END__;
  100603:	c7 45 f0 94 b6 10 00 	movl   $0x10b694,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  10060a:	c7 45 ec 95 b6 10 00 	movl   $0x10b695,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100611:	c7 45 e8 a4 d6 10 00 	movl   $0x10d6a4,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100618:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10061b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10061e:	76 0d                	jbe    10062d <debuginfo_eip+0x71>
  100620:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100623:	83 e8 01             	sub    $0x1,%eax
  100626:	0f b6 00             	movzbl (%eax),%eax
  100629:	84 c0                	test   %al,%al
  10062b:	74 0a                	je     100637 <debuginfo_eip+0x7b>
        return -1;
  10062d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100632:	e9 91 02 00 00       	jmp    1008c8 <debuginfo_eip+0x30c>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100637:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10063e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100641:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100644:	29 c2                	sub    %eax,%edx
  100646:	89 d0                	mov    %edx,%eax
  100648:	c1 f8 02             	sar    $0x2,%eax
  10064b:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  100651:	83 e8 01             	sub    $0x1,%eax
  100654:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  100657:	ff 75 08             	pushl  0x8(%ebp)
  10065a:	6a 64                	push   $0x64
  10065c:	8d 45 e0             	lea    -0x20(%ebp),%eax
  10065f:	50                   	push   %eax
  100660:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  100663:	50                   	push   %eax
  100664:	ff 75 f4             	pushl  -0xc(%ebp)
  100667:	e8 fa fd ff ff       	call   100466 <stab_binsearch>
  10066c:	83 c4 14             	add    $0x14,%esp
    if (lfile == 0)
  10066f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100672:	85 c0                	test   %eax,%eax
  100674:	75 0a                	jne    100680 <debuginfo_eip+0xc4>
        return -1;
  100676:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10067b:	e9 48 02 00 00       	jmp    1008c8 <debuginfo_eip+0x30c>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  100680:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100683:	89 45 dc             	mov    %eax,-0x24(%ebp)
  100686:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100689:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  10068c:	ff 75 08             	pushl  0x8(%ebp)
  10068f:	6a 24                	push   $0x24
  100691:	8d 45 d8             	lea    -0x28(%ebp),%eax
  100694:	50                   	push   %eax
  100695:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100698:	50                   	push   %eax
  100699:	ff 75 f4             	pushl  -0xc(%ebp)
  10069c:	e8 c5 fd ff ff       	call   100466 <stab_binsearch>
  1006a1:	83 c4 14             	add    $0x14,%esp

    if (lfun <= rfun) {
  1006a4:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1006a7:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1006aa:	39 c2                	cmp    %eax,%edx
  1006ac:	7f 7c                	jg     10072a <debuginfo_eip+0x16e>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  1006ae:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006b1:	89 c2                	mov    %eax,%edx
  1006b3:	89 d0                	mov    %edx,%eax
  1006b5:	01 c0                	add    %eax,%eax
  1006b7:	01 d0                	add    %edx,%eax
  1006b9:	c1 e0 02             	shl    $0x2,%eax
  1006bc:	89 c2                	mov    %eax,%edx
  1006be:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006c1:	01 d0                	add    %edx,%eax
  1006c3:	8b 00                	mov    (%eax),%eax
  1006c5:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1006c8:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1006cb:	29 d1                	sub    %edx,%ecx
  1006cd:	89 ca                	mov    %ecx,%edx
  1006cf:	39 d0                	cmp    %edx,%eax
  1006d1:	73 22                	jae    1006f5 <debuginfo_eip+0x139>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  1006d3:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006d6:	89 c2                	mov    %eax,%edx
  1006d8:	89 d0                	mov    %edx,%eax
  1006da:	01 c0                	add    %eax,%eax
  1006dc:	01 d0                	add    %edx,%eax
  1006de:	c1 e0 02             	shl    $0x2,%eax
  1006e1:	89 c2                	mov    %eax,%edx
  1006e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006e6:	01 d0                	add    %edx,%eax
  1006e8:	8b 10                	mov    (%eax),%edx
  1006ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1006ed:	01 c2                	add    %eax,%edx
  1006ef:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006f2:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  1006f5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006f8:	89 c2                	mov    %eax,%edx
  1006fa:	89 d0                	mov    %edx,%eax
  1006fc:	01 c0                	add    %eax,%eax
  1006fe:	01 d0                	add    %edx,%eax
  100700:	c1 e0 02             	shl    $0x2,%eax
  100703:	89 c2                	mov    %eax,%edx
  100705:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100708:	01 d0                	add    %edx,%eax
  10070a:	8b 50 08             	mov    0x8(%eax),%edx
  10070d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100710:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100713:	8b 45 0c             	mov    0xc(%ebp),%eax
  100716:	8b 40 10             	mov    0x10(%eax),%eax
  100719:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  10071c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10071f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  100722:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100725:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100728:	eb 15                	jmp    10073f <debuginfo_eip+0x183>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  10072a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10072d:	8b 55 08             	mov    0x8(%ebp),%edx
  100730:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  100733:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100736:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  100739:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10073c:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  10073f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100742:	8b 40 08             	mov    0x8(%eax),%eax
  100745:	83 ec 08             	sub    $0x8,%esp
  100748:	6a 3a                	push   $0x3a
  10074a:	50                   	push   %eax
  10074b:	e8 8c 24 00 00       	call   102bdc <strfind>
  100750:	83 c4 10             	add    $0x10,%esp
  100753:	89 c2                	mov    %eax,%edx
  100755:	8b 45 0c             	mov    0xc(%ebp),%eax
  100758:	8b 40 08             	mov    0x8(%eax),%eax
  10075b:	29 c2                	sub    %eax,%edx
  10075d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100760:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  100763:	83 ec 0c             	sub    $0xc,%esp
  100766:	ff 75 08             	pushl  0x8(%ebp)
  100769:	6a 44                	push   $0x44
  10076b:	8d 45 d0             	lea    -0x30(%ebp),%eax
  10076e:	50                   	push   %eax
  10076f:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  100772:	50                   	push   %eax
  100773:	ff 75 f4             	pushl  -0xc(%ebp)
  100776:	e8 eb fc ff ff       	call   100466 <stab_binsearch>
  10077b:	83 c4 20             	add    $0x20,%esp
    if (lline <= rline) {
  10077e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100781:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100784:	39 c2                	cmp    %eax,%edx
  100786:	7f 24                	jg     1007ac <debuginfo_eip+0x1f0>
        info->eip_line = stabs[rline].n_desc;
  100788:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10078b:	89 c2                	mov    %eax,%edx
  10078d:	89 d0                	mov    %edx,%eax
  10078f:	01 c0                	add    %eax,%eax
  100791:	01 d0                	add    %edx,%eax
  100793:	c1 e0 02             	shl    $0x2,%eax
  100796:	89 c2                	mov    %eax,%edx
  100798:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10079b:	01 d0                	add    %edx,%eax
  10079d:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  1007a1:	0f b7 d0             	movzwl %ax,%edx
  1007a4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007a7:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1007aa:	eb 13                	jmp    1007bf <debuginfo_eip+0x203>
        return -1;
  1007ac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007b1:	e9 12 01 00 00       	jmp    1008c8 <debuginfo_eip+0x30c>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  1007b6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007b9:	83 e8 01             	sub    $0x1,%eax
  1007bc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  1007bf:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007c2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007c5:	39 c2                	cmp    %eax,%edx
  1007c7:	7c 56                	jl     10081f <debuginfo_eip+0x263>
           && stabs[lline].n_type != N_SOL
  1007c9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007cc:	89 c2                	mov    %eax,%edx
  1007ce:	89 d0                	mov    %edx,%eax
  1007d0:	01 c0                	add    %eax,%eax
  1007d2:	01 d0                	add    %edx,%eax
  1007d4:	c1 e0 02             	shl    $0x2,%eax
  1007d7:	89 c2                	mov    %eax,%edx
  1007d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007dc:	01 d0                	add    %edx,%eax
  1007de:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1007e2:	3c 84                	cmp    $0x84,%al
  1007e4:	74 39                	je     10081f <debuginfo_eip+0x263>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  1007e6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007e9:	89 c2                	mov    %eax,%edx
  1007eb:	89 d0                	mov    %edx,%eax
  1007ed:	01 c0                	add    %eax,%eax
  1007ef:	01 d0                	add    %edx,%eax
  1007f1:	c1 e0 02             	shl    $0x2,%eax
  1007f4:	89 c2                	mov    %eax,%edx
  1007f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007f9:	01 d0                	add    %edx,%eax
  1007fb:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1007ff:	3c 64                	cmp    $0x64,%al
  100801:	75 b3                	jne    1007b6 <debuginfo_eip+0x1fa>
  100803:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100806:	89 c2                	mov    %eax,%edx
  100808:	89 d0                	mov    %edx,%eax
  10080a:	01 c0                	add    %eax,%eax
  10080c:	01 d0                	add    %edx,%eax
  10080e:	c1 e0 02             	shl    $0x2,%eax
  100811:	89 c2                	mov    %eax,%edx
  100813:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100816:	01 d0                	add    %edx,%eax
  100818:	8b 40 08             	mov    0x8(%eax),%eax
  10081b:	85 c0                	test   %eax,%eax
  10081d:	74 97                	je     1007b6 <debuginfo_eip+0x1fa>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  10081f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100822:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100825:	39 c2                	cmp    %eax,%edx
  100827:	7c 46                	jl     10086f <debuginfo_eip+0x2b3>
  100829:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10082c:	89 c2                	mov    %eax,%edx
  10082e:	89 d0                	mov    %edx,%eax
  100830:	01 c0                	add    %eax,%eax
  100832:	01 d0                	add    %edx,%eax
  100834:	c1 e0 02             	shl    $0x2,%eax
  100837:	89 c2                	mov    %eax,%edx
  100839:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10083c:	01 d0                	add    %edx,%eax
  10083e:	8b 00                	mov    (%eax),%eax
  100840:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100843:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100846:	29 d1                	sub    %edx,%ecx
  100848:	89 ca                	mov    %ecx,%edx
  10084a:	39 d0                	cmp    %edx,%eax
  10084c:	73 21                	jae    10086f <debuginfo_eip+0x2b3>
        info->eip_file = stabstr + stabs[lline].n_strx;
  10084e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100851:	89 c2                	mov    %eax,%edx
  100853:	89 d0                	mov    %edx,%eax
  100855:	01 c0                	add    %eax,%eax
  100857:	01 d0                	add    %edx,%eax
  100859:	c1 e0 02             	shl    $0x2,%eax
  10085c:	89 c2                	mov    %eax,%edx
  10085e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100861:	01 d0                	add    %edx,%eax
  100863:	8b 10                	mov    (%eax),%edx
  100865:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100868:	01 c2                	add    %eax,%edx
  10086a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10086d:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  10086f:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100872:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100875:	39 c2                	cmp    %eax,%edx
  100877:	7d 4a                	jge    1008c3 <debuginfo_eip+0x307>
        for (lline = lfun + 1;
  100879:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10087c:	83 c0 01             	add    $0x1,%eax
  10087f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  100882:	eb 18                	jmp    10089c <debuginfo_eip+0x2e0>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100884:	8b 45 0c             	mov    0xc(%ebp),%eax
  100887:	8b 40 14             	mov    0x14(%eax),%eax
  10088a:	8d 50 01             	lea    0x1(%eax),%edx
  10088d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100890:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  100893:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100896:	83 c0 01             	add    $0x1,%eax
  100899:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  10089c:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10089f:	8b 45 d8             	mov    -0x28(%ebp),%eax
        for (lline = lfun + 1;
  1008a2:	39 c2                	cmp    %eax,%edx
  1008a4:	7d 1d                	jge    1008c3 <debuginfo_eip+0x307>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008a6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008a9:	89 c2                	mov    %eax,%edx
  1008ab:	89 d0                	mov    %edx,%eax
  1008ad:	01 c0                	add    %eax,%eax
  1008af:	01 d0                	add    %edx,%eax
  1008b1:	c1 e0 02             	shl    $0x2,%eax
  1008b4:	89 c2                	mov    %eax,%edx
  1008b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008b9:	01 d0                	add    %edx,%eax
  1008bb:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1008bf:	3c a0                	cmp    $0xa0,%al
  1008c1:	74 c1                	je     100884 <debuginfo_eip+0x2c8>
        }
    }
    return 0;
  1008c3:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1008c8:	c9                   	leave  
  1008c9:	c3                   	ret    

001008ca <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  1008ca:	55                   	push   %ebp
  1008cb:	89 e5                	mov    %esp,%ebp
  1008cd:	83 ec 08             	sub    $0x8,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  1008d0:	83 ec 0c             	sub    $0xc,%esp
  1008d3:	68 f2 35 10 00       	push   $0x1035f2
  1008d8:	e8 67 f9 ff ff       	call   100244 <cprintf>
  1008dd:	83 c4 10             	add    $0x10,%esp
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  1008e0:	83 ec 08             	sub    $0x8,%esp
  1008e3:	68 00 00 10 00       	push   $0x100000
  1008e8:	68 0b 36 10 00       	push   $0x10360b
  1008ed:	e8 52 f9 ff ff       	call   100244 <cprintf>
  1008f2:	83 c4 10             	add    $0x10,%esp
    cprintf("  etext  0x%08x (phys)\n", etext);
  1008f5:	83 ec 08             	sub    $0x8,%esp
  1008f8:	68 f9 34 10 00       	push   $0x1034f9
  1008fd:	68 23 36 10 00       	push   $0x103623
  100902:	e8 3d f9 ff ff       	call   100244 <cprintf>
  100907:	83 c4 10             	add    $0x10,%esp
    cprintf("  edata  0x%08x (phys)\n", edata);
  10090a:	83 ec 08             	sub    $0x8,%esp
  10090d:	68 56 ea 10 00       	push   $0x10ea56
  100912:	68 3b 36 10 00       	push   $0x10363b
  100917:	e8 28 f9 ff ff       	call   100244 <cprintf>
  10091c:	83 c4 10             	add    $0x10,%esp
    cprintf("  end    0x%08x (phys)\n", end);
  10091f:	83 ec 08             	sub    $0x8,%esp
  100922:	68 80 fe 10 00       	push   $0x10fe80
  100927:	68 53 36 10 00       	push   $0x103653
  10092c:	e8 13 f9 ff ff       	call   100244 <cprintf>
  100931:	83 c4 10             	add    $0x10,%esp
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100934:	b8 80 fe 10 00       	mov    $0x10fe80,%eax
  100939:	05 ff 03 00 00       	add    $0x3ff,%eax
  10093e:	ba 00 00 10 00       	mov    $0x100000,%edx
  100943:	29 d0                	sub    %edx,%eax
  100945:	99                   	cltd   
  100946:	c1 ea 16             	shr    $0x16,%edx
  100949:	01 d0                	add    %edx,%eax
  10094b:	c1 f8 0a             	sar    $0xa,%eax
  10094e:	83 ec 08             	sub    $0x8,%esp
  100951:	50                   	push   %eax
  100952:	68 6c 36 10 00       	push   $0x10366c
  100957:	e8 e8 f8 ff ff       	call   100244 <cprintf>
  10095c:	83 c4 10             	add    $0x10,%esp
}
  10095f:	c9                   	leave  
  100960:	c3                   	ret    

00100961 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  100961:	55                   	push   %ebp
  100962:	89 e5                	mov    %esp,%ebp
  100964:	81 ec 28 01 00 00    	sub    $0x128,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  10096a:	83 ec 08             	sub    $0x8,%esp
  10096d:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100970:	50                   	push   %eax
  100971:	ff 75 08             	pushl  0x8(%ebp)
  100974:	e8 43 fc ff ff       	call   1005bc <debuginfo_eip>
  100979:	83 c4 10             	add    $0x10,%esp
  10097c:	85 c0                	test   %eax,%eax
  10097e:	74 15                	je     100995 <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  100980:	83 ec 08             	sub    $0x8,%esp
  100983:	ff 75 08             	pushl  0x8(%ebp)
  100986:	68 96 36 10 00       	push   $0x103696
  10098b:	e8 b4 f8 ff ff       	call   100244 <cprintf>
  100990:	83 c4 10             	add    $0x10,%esp
  100993:	eb 65                	jmp    1009fa <print_debuginfo+0x99>
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100995:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10099c:	eb 1c                	jmp    1009ba <print_debuginfo+0x59>
            fnname[j] = info.eip_fn_name[j];
  10099e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1009a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009a4:	01 d0                	add    %edx,%eax
  1009a6:	0f b6 00             	movzbl (%eax),%eax
  1009a9:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1009af:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1009b2:	01 ca                	add    %ecx,%edx
  1009b4:	88 02                	mov    %al,(%edx)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009b6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1009ba:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009bd:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  1009c0:	7f dc                	jg     10099e <print_debuginfo+0x3d>
        }
        fnname[j] = '\0';
  1009c2:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  1009c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009cb:	01 d0                	add    %edx,%eax
  1009cd:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  1009d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  1009d3:	8b 55 08             	mov    0x8(%ebp),%edx
  1009d6:	89 d1                	mov    %edx,%ecx
  1009d8:	29 c1                	sub    %eax,%ecx
  1009da:	8b 55 e0             	mov    -0x20(%ebp),%edx
  1009dd:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1009e0:	83 ec 0c             	sub    $0xc,%esp
  1009e3:	51                   	push   %ecx
  1009e4:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1009ea:	51                   	push   %ecx
  1009eb:	52                   	push   %edx
  1009ec:	50                   	push   %eax
  1009ed:	68 b2 36 10 00       	push   $0x1036b2
  1009f2:	e8 4d f8 ff ff       	call   100244 <cprintf>
  1009f7:	83 c4 20             	add    $0x20,%esp
    }
}
  1009fa:	c9                   	leave  
  1009fb:	c3                   	ret    

001009fc <read_eip>:

static __noinline uint32_t
read_eip(void) {
  1009fc:	55                   	push   %ebp
  1009fd:	89 e5                	mov    %esp,%ebp
  1009ff:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100a02:	8b 45 04             	mov    0x4(%ebp),%eax
  100a05:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100a08:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100a0b:	c9                   	leave  
  100a0c:	c3                   	ret    

00100a0d <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100a0d:	55                   	push   %ebp
  100a0e:	89 e5                	mov    %esp,%ebp
  100a10:	83 ec 28             	sub    $0x28,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100a13:	89 e8                	mov    %ebp,%eax
  100a15:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return ebp;
  100a18:	8b 45 e0             	mov    -0x20(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
    uint32_t ebp = read_ebp(), eip = read_eip();
  100a1b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100a1e:	e8 d9 ff ff ff       	call   1009fc <read_eip>
  100a23:	89 45 f0             	mov    %eax,-0x10(%ebp)

    int i, j;
    for (i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++) {
  100a26:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100a2d:	e9 8d 00 00 00       	jmp    100abf <print_stackframe+0xb2>
        cprintf("ebp:0x%08x eip:0x%08x args:", ebp, eip);
  100a32:	83 ec 04             	sub    $0x4,%esp
  100a35:	ff 75 f0             	pushl  -0x10(%ebp)
  100a38:	ff 75 f4             	pushl  -0xc(%ebp)
  100a3b:	68 c4 36 10 00       	push   $0x1036c4
  100a40:	e8 ff f7 ff ff       	call   100244 <cprintf>
  100a45:	83 c4 10             	add    $0x10,%esp
        uint32_t *args = (uint32_t *)ebp + 2;
  100a48:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a4b:	83 c0 08             	add    $0x8,%eax
  100a4e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        for (j = 0; j < 4; j ++) {
  100a51:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100a58:	eb 26                	jmp    100a80 <print_stackframe+0x73>
            cprintf("0x%08x ", args[j]);
  100a5a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a5d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100a64:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100a67:	01 d0                	add    %edx,%eax
  100a69:	8b 00                	mov    (%eax),%eax
  100a6b:	83 ec 08             	sub    $0x8,%esp
  100a6e:	50                   	push   %eax
  100a6f:	68 e0 36 10 00       	push   $0x1036e0
  100a74:	e8 cb f7 ff ff       	call   100244 <cprintf>
  100a79:	83 c4 10             	add    $0x10,%esp
        for (j = 0; j < 4; j ++) {
  100a7c:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
  100a80:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  100a84:	7e d4                	jle    100a5a <print_stackframe+0x4d>
        }
        cprintf("\n");
  100a86:	83 ec 0c             	sub    $0xc,%esp
  100a89:	68 e8 36 10 00       	push   $0x1036e8
  100a8e:	e8 b1 f7 ff ff       	call   100244 <cprintf>
  100a93:	83 c4 10             	add    $0x10,%esp
        print_debuginfo(eip - 1);
  100a96:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a99:	83 e8 01             	sub    $0x1,%eax
  100a9c:	83 ec 0c             	sub    $0xc,%esp
  100a9f:	50                   	push   %eax
  100aa0:	e8 bc fe ff ff       	call   100961 <print_debuginfo>
  100aa5:	83 c4 10             	add    $0x10,%esp
        eip = ((uint32_t *)ebp)[1];
  100aa8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100aab:	83 c0 04             	add    $0x4,%eax
  100aae:	8b 00                	mov    (%eax),%eax
  100ab0:	89 45 f0             	mov    %eax,-0x10(%ebp)
        ebp = ((uint32_t *)ebp)[0];
  100ab3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ab6:	8b 00                	mov    (%eax),%eax
  100ab8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    for (i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++) {
  100abb:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  100abf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100ac3:	74 0a                	je     100acf <print_stackframe+0xc2>
  100ac5:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100ac9:	0f 8e 63 ff ff ff    	jle    100a32 <print_stackframe+0x25>
    }
}
  100acf:	c9                   	leave  
  100ad0:	c3                   	ret    

00100ad1 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100ad1:	55                   	push   %ebp
  100ad2:	89 e5                	mov    %esp,%ebp
  100ad4:	83 ec 18             	sub    $0x18,%esp
    int argc = 0;
  100ad7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100ade:	eb 0c                	jmp    100aec <parse+0x1b>
            *buf ++ = '\0';
  100ae0:	8b 45 08             	mov    0x8(%ebp),%eax
  100ae3:	8d 50 01             	lea    0x1(%eax),%edx
  100ae6:	89 55 08             	mov    %edx,0x8(%ebp)
  100ae9:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100aec:	8b 45 08             	mov    0x8(%ebp),%eax
  100aef:	0f b6 00             	movzbl (%eax),%eax
  100af2:	84 c0                	test   %al,%al
  100af4:	74 1e                	je     100b14 <parse+0x43>
  100af6:	8b 45 08             	mov    0x8(%ebp),%eax
  100af9:	0f b6 00             	movzbl (%eax),%eax
  100afc:	0f be c0             	movsbl %al,%eax
  100aff:	83 ec 08             	sub    $0x8,%esp
  100b02:	50                   	push   %eax
  100b03:	68 6c 37 10 00       	push   $0x10376c
  100b08:	e8 9c 20 00 00       	call   102ba9 <strchr>
  100b0d:	83 c4 10             	add    $0x10,%esp
  100b10:	85 c0                	test   %eax,%eax
  100b12:	75 cc                	jne    100ae0 <parse+0xf>
        }
        if (*buf == '\0') {
  100b14:	8b 45 08             	mov    0x8(%ebp),%eax
  100b17:	0f b6 00             	movzbl (%eax),%eax
  100b1a:	84 c0                	test   %al,%al
  100b1c:	75 02                	jne    100b20 <parse+0x4f>
            break;
  100b1e:	eb 65                	jmp    100b85 <parse+0xb4>
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100b20:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100b24:	75 12                	jne    100b38 <parse+0x67>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100b26:	83 ec 08             	sub    $0x8,%esp
  100b29:	6a 10                	push   $0x10
  100b2b:	68 71 37 10 00       	push   $0x103771
  100b30:	e8 0f f7 ff ff       	call   100244 <cprintf>
  100b35:	83 c4 10             	add    $0x10,%esp
        }
        argv[argc ++] = buf;
  100b38:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b3b:	8d 50 01             	lea    0x1(%eax),%edx
  100b3e:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100b41:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100b48:	8b 45 0c             	mov    0xc(%ebp),%eax
  100b4b:	01 c2                	add    %eax,%edx
  100b4d:	8b 45 08             	mov    0x8(%ebp),%eax
  100b50:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b52:	eb 04                	jmp    100b58 <parse+0x87>
            buf ++;
  100b54:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b58:	8b 45 08             	mov    0x8(%ebp),%eax
  100b5b:	0f b6 00             	movzbl (%eax),%eax
  100b5e:	84 c0                	test   %al,%al
  100b60:	74 1e                	je     100b80 <parse+0xaf>
  100b62:	8b 45 08             	mov    0x8(%ebp),%eax
  100b65:	0f b6 00             	movzbl (%eax),%eax
  100b68:	0f be c0             	movsbl %al,%eax
  100b6b:	83 ec 08             	sub    $0x8,%esp
  100b6e:	50                   	push   %eax
  100b6f:	68 6c 37 10 00       	push   $0x10376c
  100b74:	e8 30 20 00 00       	call   102ba9 <strchr>
  100b79:	83 c4 10             	add    $0x10,%esp
  100b7c:	85 c0                	test   %eax,%eax
  100b7e:	74 d4                	je     100b54 <parse+0x83>
        }
    }
  100b80:	e9 59 ff ff ff       	jmp    100ade <parse+0xd>
    return argc;
  100b85:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100b88:	c9                   	leave  
  100b89:	c3                   	ret    

00100b8a <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100b8a:	55                   	push   %ebp
  100b8b:	89 e5                	mov    %esp,%ebp
  100b8d:	83 ec 58             	sub    $0x58,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100b90:	83 ec 08             	sub    $0x8,%esp
  100b93:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b96:	50                   	push   %eax
  100b97:	ff 75 08             	pushl  0x8(%ebp)
  100b9a:	e8 32 ff ff ff       	call   100ad1 <parse>
  100b9f:	83 c4 10             	add    $0x10,%esp
  100ba2:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100ba5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100ba9:	75 0a                	jne    100bb5 <runcmd+0x2b>
        return 0;
  100bab:	b8 00 00 00 00       	mov    $0x0,%eax
  100bb0:	e9 84 00 00 00       	jmp    100c39 <runcmd+0xaf>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100bb5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100bbc:	eb 5a                	jmp    100c18 <runcmd+0x8e>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100bbe:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100bc1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100bc4:	89 d0                	mov    %edx,%eax
  100bc6:	01 c0                	add    %eax,%eax
  100bc8:	01 d0                	add    %edx,%eax
  100bca:	c1 e0 02             	shl    $0x2,%eax
  100bcd:	05 00 e0 10 00       	add    $0x10e000,%eax
  100bd2:	8b 00                	mov    (%eax),%eax
  100bd4:	83 ec 08             	sub    $0x8,%esp
  100bd7:	51                   	push   %ecx
  100bd8:	50                   	push   %eax
  100bd9:	e8 2b 1f 00 00       	call   102b09 <strcmp>
  100bde:	83 c4 10             	add    $0x10,%esp
  100be1:	85 c0                	test   %eax,%eax
  100be3:	75 2f                	jne    100c14 <runcmd+0x8a>
            return commands[i].func(argc - 1, argv + 1, tf);
  100be5:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100be8:	89 d0                	mov    %edx,%eax
  100bea:	01 c0                	add    %eax,%eax
  100bec:	01 d0                	add    %edx,%eax
  100bee:	c1 e0 02             	shl    $0x2,%eax
  100bf1:	05 00 e0 10 00       	add    $0x10e000,%eax
  100bf6:	8b 40 08             	mov    0x8(%eax),%eax
  100bf9:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100bfc:	83 ea 01             	sub    $0x1,%edx
  100bff:	83 ec 04             	sub    $0x4,%esp
  100c02:	ff 75 0c             	pushl  0xc(%ebp)
  100c05:	8d 4d b0             	lea    -0x50(%ebp),%ecx
  100c08:	83 c1 04             	add    $0x4,%ecx
  100c0b:	51                   	push   %ecx
  100c0c:	52                   	push   %edx
  100c0d:	ff d0                	call   *%eax
  100c0f:	83 c4 10             	add    $0x10,%esp
  100c12:	eb 25                	jmp    100c39 <runcmd+0xaf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100c14:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100c18:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c1b:	83 f8 02             	cmp    $0x2,%eax
  100c1e:	76 9e                	jbe    100bbe <runcmd+0x34>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100c20:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100c23:	83 ec 08             	sub    $0x8,%esp
  100c26:	50                   	push   %eax
  100c27:	68 8f 37 10 00       	push   $0x10378f
  100c2c:	e8 13 f6 ff ff       	call   100244 <cprintf>
  100c31:	83 c4 10             	add    $0x10,%esp
    return 0;
  100c34:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c39:	c9                   	leave  
  100c3a:	c3                   	ret    

00100c3b <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100c3b:	55                   	push   %ebp
  100c3c:	89 e5                	mov    %esp,%ebp
  100c3e:	83 ec 18             	sub    $0x18,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100c41:	83 ec 0c             	sub    $0xc,%esp
  100c44:	68 a8 37 10 00       	push   $0x1037a8
  100c49:	e8 f6 f5 ff ff       	call   100244 <cprintf>
  100c4e:	83 c4 10             	add    $0x10,%esp
    cprintf("Type 'help' for a list of commands.\n");
  100c51:	83 ec 0c             	sub    $0xc,%esp
  100c54:	68 d0 37 10 00       	push   $0x1037d0
  100c59:	e8 e6 f5 ff ff       	call   100244 <cprintf>
  100c5e:	83 c4 10             	add    $0x10,%esp

    if (tf != NULL) {
  100c61:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100c65:	74 0e                	je     100c75 <kmonitor+0x3a>
        print_trapframe(tf);
  100c67:	83 ec 0c             	sub    $0xc,%esp
  100c6a:	ff 75 08             	pushl  0x8(%ebp)
  100c6d:	e8 19 0d 00 00       	call   10198b <print_trapframe>
  100c72:	83 c4 10             	add    $0x10,%esp
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100c75:	83 ec 0c             	sub    $0xc,%esp
  100c78:	68 f5 37 10 00       	push   $0x1037f5
  100c7d:	e8 65 f6 ff ff       	call   1002e7 <readline>
  100c82:	83 c4 10             	add    $0x10,%esp
  100c85:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c88:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100c8c:	74 17                	je     100ca5 <kmonitor+0x6a>
            if (runcmd(buf, tf) < 0) {
  100c8e:	83 ec 08             	sub    $0x8,%esp
  100c91:	ff 75 08             	pushl  0x8(%ebp)
  100c94:	ff 75 f4             	pushl  -0xc(%ebp)
  100c97:	e8 ee fe ff ff       	call   100b8a <runcmd>
  100c9c:	83 c4 10             	add    $0x10,%esp
  100c9f:	85 c0                	test   %eax,%eax
  100ca1:	79 02                	jns    100ca5 <kmonitor+0x6a>
                break;
  100ca3:	eb 02                	jmp    100ca7 <kmonitor+0x6c>
            }
        }
    }
  100ca5:	eb ce                	jmp    100c75 <kmonitor+0x3a>
}
  100ca7:	c9                   	leave  
  100ca8:	c3                   	ret    

00100ca9 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100ca9:	55                   	push   %ebp
  100caa:	89 e5                	mov    %esp,%ebp
  100cac:	83 ec 18             	sub    $0x18,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100caf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100cb6:	eb 3d                	jmp    100cf5 <mon_help+0x4c>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100cb8:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100cbb:	89 d0                	mov    %edx,%eax
  100cbd:	01 c0                	add    %eax,%eax
  100cbf:	01 d0                	add    %edx,%eax
  100cc1:	c1 e0 02             	shl    $0x2,%eax
  100cc4:	05 00 e0 10 00       	add    $0x10e000,%eax
  100cc9:	8b 48 04             	mov    0x4(%eax),%ecx
  100ccc:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100ccf:	89 d0                	mov    %edx,%eax
  100cd1:	01 c0                	add    %eax,%eax
  100cd3:	01 d0                	add    %edx,%eax
  100cd5:	c1 e0 02             	shl    $0x2,%eax
  100cd8:	05 00 e0 10 00       	add    $0x10e000,%eax
  100cdd:	8b 00                	mov    (%eax),%eax
  100cdf:	83 ec 04             	sub    $0x4,%esp
  100ce2:	51                   	push   %ecx
  100ce3:	50                   	push   %eax
  100ce4:	68 f9 37 10 00       	push   $0x1037f9
  100ce9:	e8 56 f5 ff ff       	call   100244 <cprintf>
  100cee:	83 c4 10             	add    $0x10,%esp
    for (i = 0; i < NCOMMANDS; i ++) {
  100cf1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100cf5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cf8:	83 f8 02             	cmp    $0x2,%eax
  100cfb:	76 bb                	jbe    100cb8 <mon_help+0xf>
    }
    return 0;
  100cfd:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d02:	c9                   	leave  
  100d03:	c3                   	ret    

00100d04 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100d04:	55                   	push   %ebp
  100d05:	89 e5                	mov    %esp,%ebp
  100d07:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100d0a:	e8 bb fb ff ff       	call   1008ca <print_kerninfo>
    return 0;
  100d0f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d14:	c9                   	leave  
  100d15:	c3                   	ret    

00100d16 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100d16:	55                   	push   %ebp
  100d17:	89 e5                	mov    %esp,%ebp
  100d19:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100d1c:	e8 ec fc ff ff       	call   100a0d <print_stackframe>
    return 0;
  100d21:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d26:	c9                   	leave  
  100d27:	c3                   	ret    

00100d28 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d28:	55                   	push   %ebp
  100d29:	89 e5                	mov    %esp,%ebp
  100d2b:	83 ec 18             	sub    $0x18,%esp
  100d2e:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100d34:	c6 45 f5 34          	movb   $0x34,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d38:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100d3c:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d40:	ee                   	out    %al,(%dx)
  100d41:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d47:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
  100d4b:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d4f:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d53:	ee                   	out    %al,(%dx)
  100d54:	66 c7 45 ee 40 00    	movw   $0x40,-0x12(%ebp)
  100d5a:	c6 45 ed 2e          	movb   $0x2e,-0x13(%ebp)
  100d5e:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100d62:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100d66:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100d67:	c7 05 e8 f9 10 00 00 	movl   $0x0,0x10f9e8
  100d6e:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100d71:	83 ec 0c             	sub    $0xc,%esp
  100d74:	68 02 38 10 00       	push   $0x103802
  100d79:	e8 c6 f4 ff ff       	call   100244 <cprintf>
  100d7e:	83 c4 10             	add    $0x10,%esp
    pic_enable(IRQ_TIMER);
  100d81:	83 ec 0c             	sub    $0xc,%esp
  100d84:	6a 00                	push   $0x0
  100d86:	e8 ba 08 00 00       	call   101645 <pic_enable>
  100d8b:	83 c4 10             	add    $0x10,%esp
}
  100d8e:	c9                   	leave  
  100d8f:	c3                   	ret    

00100d90 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100d90:	55                   	push   %ebp
  100d91:	89 e5                	mov    %esp,%ebp
  100d93:	83 ec 10             	sub    $0x10,%esp
  100d96:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100d9c:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100da0:	89 c2                	mov    %eax,%edx
  100da2:	ec                   	in     (%dx),%al
  100da3:	88 45 fd             	mov    %al,-0x3(%ebp)
  100da6:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100dac:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100db0:	89 c2                	mov    %eax,%edx
  100db2:	ec                   	in     (%dx),%al
  100db3:	88 45 f9             	mov    %al,-0x7(%ebp)
  100db6:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100dbc:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100dc0:	89 c2                	mov    %eax,%edx
  100dc2:	ec                   	in     (%dx),%al
  100dc3:	88 45 f5             	mov    %al,-0xb(%ebp)
  100dc6:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
  100dcc:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100dd0:	89 c2                	mov    %eax,%edx
  100dd2:	ec                   	in     (%dx),%al
  100dd3:	88 45 f1             	mov    %al,-0xf(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100dd6:	c9                   	leave  
  100dd7:	c3                   	ret    

00100dd8 <cga_init>:
static uint16_t addr_6845;

/* TEXT-mode CGA/VGA display output */

static void
cga_init(void) {
  100dd8:	55                   	push   %ebp
  100dd9:	89 e5                	mov    %esp,%ebp
  100ddb:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;
  100dde:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;
  100de5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100de8:	0f b7 00             	movzwl (%eax),%eax
  100deb:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;
  100def:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100df2:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {
  100df7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100dfa:	0f b7 00             	movzwl (%eax),%eax
  100dfd:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100e01:	74 12                	je     100e15 <cga_init+0x3d>
        cp = (uint16_t*)MONO_BUF;
  100e03:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;
  100e0a:	66 c7 05 06 ef 10 00 	movw   $0x3b4,0x10ef06
  100e11:	b4 03 
  100e13:	eb 13                	jmp    100e28 <cga_init+0x50>
    } else {
        *cp = was;
  100e15:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e18:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e1c:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;
  100e1f:	66 c7 05 06 ef 10 00 	movw   $0x3d4,0x10ef06
  100e26:	d4 03 
    }

    // Extract cursor location
    uint32_t pos;
    outb(addr_6845, 14);
  100e28:	0f b7 05 06 ef 10 00 	movzwl 0x10ef06,%eax
  100e2f:	0f b7 c0             	movzwl %ax,%eax
  100e32:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  100e36:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e3a:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100e3e:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100e42:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;
  100e43:	0f b7 05 06 ef 10 00 	movzwl 0x10ef06,%eax
  100e4a:	83 c0 01             	add    $0x1,%eax
  100e4d:	0f b7 c0             	movzwl %ax,%eax
  100e50:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e54:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100e58:	89 c2                	mov    %eax,%edx
  100e5a:	ec                   	in     (%dx),%al
  100e5b:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100e5e:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100e62:	0f b6 c0             	movzbl %al,%eax
  100e65:	c1 e0 08             	shl    $0x8,%eax
  100e68:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100e6b:	0f b7 05 06 ef 10 00 	movzwl 0x10ef06,%eax
  100e72:	0f b7 c0             	movzwl %ax,%eax
  100e75:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  100e79:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e7d:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100e81:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100e85:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);
  100e86:	0f b7 05 06 ef 10 00 	movzwl 0x10ef06,%eax
  100e8d:	83 c0 01             	add    $0x1,%eax
  100e90:	0f b7 c0             	movzwl %ax,%eax
  100e93:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e97:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
  100e9b:	89 c2                	mov    %eax,%edx
  100e9d:	ec                   	in     (%dx),%al
  100e9e:	88 45 e5             	mov    %al,-0x1b(%ebp)
    return data;
  100ea1:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100ea5:	0f b6 c0             	movzbl %al,%eax
  100ea8:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;
  100eab:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100eae:	a3 00 ef 10 00       	mov    %eax,0x10ef00
    crt_pos = pos;
  100eb3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100eb6:	66 a3 04 ef 10 00    	mov    %ax,0x10ef04
}
  100ebc:	c9                   	leave  
  100ebd:	c3                   	ret    

00100ebe <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100ebe:	55                   	push   %ebp
  100ebf:	89 e5                	mov    %esp,%ebp
  100ec1:	83 ec 38             	sub    $0x38,%esp
  100ec4:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100eca:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ece:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100ed2:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100ed6:	ee                   	out    %al,(%dx)
  100ed7:	66 c7 45 f2 fb 03    	movw   $0x3fb,-0xe(%ebp)
  100edd:	c6 45 f1 80          	movb   $0x80,-0xf(%ebp)
  100ee1:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100ee5:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100ee9:	ee                   	out    %al,(%dx)
  100eea:	66 c7 45 ee f8 03    	movw   $0x3f8,-0x12(%ebp)
  100ef0:	c6 45 ed 0c          	movb   $0xc,-0x13(%ebp)
  100ef4:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100ef8:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100efc:	ee                   	out    %al,(%dx)
  100efd:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f03:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
  100f07:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f0b:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f0f:	ee                   	out    %al,(%dx)
  100f10:	66 c7 45 e6 fb 03    	movw   $0x3fb,-0x1a(%ebp)
  100f16:	c6 45 e5 03          	movb   $0x3,-0x1b(%ebp)
  100f1a:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f1e:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100f22:	ee                   	out    %al,(%dx)
  100f23:	66 c7 45 e2 fc 03    	movw   $0x3fc,-0x1e(%ebp)
  100f29:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
  100f2d:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f31:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f35:	ee                   	out    %al,(%dx)
  100f36:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f3c:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
  100f40:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f44:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100f48:	ee                   	out    %al,(%dx)
  100f49:	66 c7 45 da fd 03    	movw   $0x3fd,-0x26(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f4f:	0f b7 45 da          	movzwl -0x26(%ebp),%eax
  100f53:	89 c2                	mov    %eax,%edx
  100f55:	ec                   	in     (%dx),%al
  100f56:	88 45 d9             	mov    %al,-0x27(%ebp)
    return data;
  100f59:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f5d:	3c ff                	cmp    $0xff,%al
  100f5f:	0f 95 c0             	setne  %al
  100f62:	0f b6 c0             	movzbl %al,%eax
  100f65:	a3 08 ef 10 00       	mov    %eax,0x10ef08
  100f6a:	66 c7 45 d6 fa 03    	movw   $0x3fa,-0x2a(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f70:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
  100f74:	89 c2                	mov    %eax,%edx
  100f76:	ec                   	in     (%dx),%al
  100f77:	88 45 d5             	mov    %al,-0x2b(%ebp)
  100f7a:	66 c7 45 d2 f8 03    	movw   $0x3f8,-0x2e(%ebp)
  100f80:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
  100f84:	89 c2                	mov    %eax,%edx
  100f86:	ec                   	in     (%dx),%al
  100f87:	88 45 d1             	mov    %al,-0x2f(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100f8a:	a1 08 ef 10 00       	mov    0x10ef08,%eax
  100f8f:	85 c0                	test   %eax,%eax
  100f91:	74 0d                	je     100fa0 <serial_init+0xe2>
        pic_enable(IRQ_COM1);
  100f93:	83 ec 0c             	sub    $0xc,%esp
  100f96:	6a 04                	push   $0x4
  100f98:	e8 a8 06 00 00       	call   101645 <pic_enable>
  100f9d:	83 c4 10             	add    $0x10,%esp
    }
}
  100fa0:	c9                   	leave  
  100fa1:	c3                   	ret    

00100fa2 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100fa2:	55                   	push   %ebp
  100fa3:	89 e5                	mov    %esp,%ebp
  100fa5:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fa8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100faf:	eb 09                	jmp    100fba <lpt_putc_sub+0x18>
        delay();
  100fb1:	e8 da fd ff ff       	call   100d90 <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fb6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100fba:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  100fc0:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100fc4:	89 c2                	mov    %eax,%edx
  100fc6:	ec                   	in     (%dx),%al
  100fc7:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  100fca:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  100fce:	84 c0                	test   %al,%al
  100fd0:	78 09                	js     100fdb <lpt_putc_sub+0x39>
  100fd2:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  100fd9:	7e d6                	jle    100fb1 <lpt_putc_sub+0xf>
    }
    outb(LPTPORT + 0, c);
  100fdb:	8b 45 08             	mov    0x8(%ebp),%eax
  100fde:	0f b6 c0             	movzbl %al,%eax
  100fe1:	66 c7 45 f6 78 03    	movw   $0x378,-0xa(%ebp)
  100fe7:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fea:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100fee:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100ff2:	ee                   	out    %al,(%dx)
  100ff3:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  100ff9:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  100ffd:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101001:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101005:	ee                   	out    %al,(%dx)
  101006:	66 c7 45 ee 7a 03    	movw   $0x37a,-0x12(%ebp)
  10100c:	c6 45 ed 08          	movb   $0x8,-0x13(%ebp)
  101010:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101014:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101018:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  101019:	c9                   	leave  
  10101a:	c3                   	ret    

0010101b <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  10101b:	55                   	push   %ebp
  10101c:	89 e5                	mov    %esp,%ebp
    if (c != '\b') {
  10101e:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101022:	74 0d                	je     101031 <lpt_putc+0x16>
        lpt_putc_sub(c);
  101024:	ff 75 08             	pushl  0x8(%ebp)
  101027:	e8 76 ff ff ff       	call   100fa2 <lpt_putc_sub>
  10102c:	83 c4 04             	add    $0x4,%esp
  10102f:	eb 1e                	jmp    10104f <lpt_putc+0x34>
    }
    else {
        lpt_putc_sub('\b');
  101031:	6a 08                	push   $0x8
  101033:	e8 6a ff ff ff       	call   100fa2 <lpt_putc_sub>
  101038:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub(' ');
  10103b:	6a 20                	push   $0x20
  10103d:	e8 60 ff ff ff       	call   100fa2 <lpt_putc_sub>
  101042:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub('\b');
  101045:	6a 08                	push   $0x8
  101047:	e8 56 ff ff ff       	call   100fa2 <lpt_putc_sub>
  10104c:	83 c4 04             	add    $0x4,%esp
    }
}
  10104f:	c9                   	leave  
  101050:	c3                   	ret    

00101051 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  101051:	55                   	push   %ebp
  101052:	89 e5                	mov    %esp,%ebp
  101054:	53                   	push   %ebx
  101055:	83 ec 24             	sub    $0x24,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  101058:	8b 45 08             	mov    0x8(%ebp),%eax
  10105b:	b0 00                	mov    $0x0,%al
  10105d:	85 c0                	test   %eax,%eax
  10105f:	75 07                	jne    101068 <cga_putc+0x17>
        c |= 0x0700;
  101061:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  101068:	8b 45 08             	mov    0x8(%ebp),%eax
  10106b:	0f b6 c0             	movzbl %al,%eax
  10106e:	83 f8 0a             	cmp    $0xa,%eax
  101071:	74 4c                	je     1010bf <cga_putc+0x6e>
  101073:	83 f8 0d             	cmp    $0xd,%eax
  101076:	74 57                	je     1010cf <cga_putc+0x7e>
  101078:	83 f8 08             	cmp    $0x8,%eax
  10107b:	0f 85 88 00 00 00    	jne    101109 <cga_putc+0xb8>
    case '\b':
        if (crt_pos > 0) {
  101081:	0f b7 05 04 ef 10 00 	movzwl 0x10ef04,%eax
  101088:	66 85 c0             	test   %ax,%ax
  10108b:	74 30                	je     1010bd <cga_putc+0x6c>
            crt_pos --;
  10108d:	0f b7 05 04 ef 10 00 	movzwl 0x10ef04,%eax
  101094:	83 e8 01             	sub    $0x1,%eax
  101097:	66 a3 04 ef 10 00    	mov    %ax,0x10ef04
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  10109d:	a1 00 ef 10 00       	mov    0x10ef00,%eax
  1010a2:	0f b7 15 04 ef 10 00 	movzwl 0x10ef04,%edx
  1010a9:	0f b7 d2             	movzwl %dx,%edx
  1010ac:	01 d2                	add    %edx,%edx
  1010ae:	01 d0                	add    %edx,%eax
  1010b0:	8b 55 08             	mov    0x8(%ebp),%edx
  1010b3:	b2 00                	mov    $0x0,%dl
  1010b5:	83 ca 20             	or     $0x20,%edx
  1010b8:	66 89 10             	mov    %dx,(%eax)
        }
        break;
  1010bb:	eb 71                	jmp    10112e <cga_putc+0xdd>
  1010bd:	eb 6f                	jmp    10112e <cga_putc+0xdd>
    case '\n':
        crt_pos += CRT_COLS;
  1010bf:	0f b7 05 04 ef 10 00 	movzwl 0x10ef04,%eax
  1010c6:	83 c0 50             	add    $0x50,%eax
  1010c9:	66 a3 04 ef 10 00    	mov    %ax,0x10ef04
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  1010cf:	0f b7 1d 04 ef 10 00 	movzwl 0x10ef04,%ebx
  1010d6:	0f b7 0d 04 ef 10 00 	movzwl 0x10ef04,%ecx
  1010dd:	0f b7 c1             	movzwl %cx,%eax
  1010e0:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  1010e6:	c1 e8 10             	shr    $0x10,%eax
  1010e9:	89 c2                	mov    %eax,%edx
  1010eb:	66 c1 ea 06          	shr    $0x6,%dx
  1010ef:	89 d0                	mov    %edx,%eax
  1010f1:	c1 e0 02             	shl    $0x2,%eax
  1010f4:	01 d0                	add    %edx,%eax
  1010f6:	c1 e0 04             	shl    $0x4,%eax
  1010f9:	29 c1                	sub    %eax,%ecx
  1010fb:	89 ca                	mov    %ecx,%edx
  1010fd:	89 d8                	mov    %ebx,%eax
  1010ff:	29 d0                	sub    %edx,%eax
  101101:	66 a3 04 ef 10 00    	mov    %ax,0x10ef04
        break;
  101107:	eb 25                	jmp    10112e <cga_putc+0xdd>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  101109:	8b 0d 00 ef 10 00    	mov    0x10ef00,%ecx
  10110f:	0f b7 05 04 ef 10 00 	movzwl 0x10ef04,%eax
  101116:	8d 50 01             	lea    0x1(%eax),%edx
  101119:	66 89 15 04 ef 10 00 	mov    %dx,0x10ef04
  101120:	0f b7 c0             	movzwl %ax,%eax
  101123:	01 c0                	add    %eax,%eax
  101125:	01 c8                	add    %ecx,%eax
  101127:	8b 55 08             	mov    0x8(%ebp),%edx
  10112a:	66 89 10             	mov    %dx,(%eax)
        break;
  10112d:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  10112e:	0f b7 05 04 ef 10 00 	movzwl 0x10ef04,%eax
  101135:	66 3d cf 07          	cmp    $0x7cf,%ax
  101139:	76 59                	jbe    101194 <cga_putc+0x143>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  10113b:	a1 00 ef 10 00       	mov    0x10ef00,%eax
  101140:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  101146:	a1 00 ef 10 00       	mov    0x10ef00,%eax
  10114b:	83 ec 04             	sub    $0x4,%esp
  10114e:	68 00 0f 00 00       	push   $0xf00
  101153:	52                   	push   %edx
  101154:	50                   	push   %eax
  101155:	e8 4e 1c 00 00       	call   102da8 <memmove>
  10115a:	83 c4 10             	add    $0x10,%esp
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10115d:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  101164:	eb 15                	jmp    10117b <cga_putc+0x12a>
            crt_buf[i] = 0x0700 | ' ';
  101166:	a1 00 ef 10 00       	mov    0x10ef00,%eax
  10116b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10116e:	01 d2                	add    %edx,%edx
  101170:	01 d0                	add    %edx,%eax
  101172:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101177:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10117b:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  101182:	7e e2                	jle    101166 <cga_putc+0x115>
        }
        crt_pos -= CRT_COLS;
  101184:	0f b7 05 04 ef 10 00 	movzwl 0x10ef04,%eax
  10118b:	83 e8 50             	sub    $0x50,%eax
  10118e:	66 a3 04 ef 10 00    	mov    %ax,0x10ef04
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  101194:	0f b7 05 06 ef 10 00 	movzwl 0x10ef06,%eax
  10119b:	0f b7 c0             	movzwl %ax,%eax
  10119e:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  1011a2:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
  1011a6:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1011aa:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1011ae:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  1011af:	0f b7 05 04 ef 10 00 	movzwl 0x10ef04,%eax
  1011b6:	66 c1 e8 08          	shr    $0x8,%ax
  1011ba:	0f b6 c0             	movzbl %al,%eax
  1011bd:	0f b7 15 06 ef 10 00 	movzwl 0x10ef06,%edx
  1011c4:	83 c2 01             	add    $0x1,%edx
  1011c7:	0f b7 d2             	movzwl %dx,%edx
  1011ca:	66 89 55 ee          	mov    %dx,-0x12(%ebp)
  1011ce:	88 45 ed             	mov    %al,-0x13(%ebp)
  1011d1:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1011d5:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1011d9:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  1011da:	0f b7 05 06 ef 10 00 	movzwl 0x10ef06,%eax
  1011e1:	0f b7 c0             	movzwl %ax,%eax
  1011e4:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  1011e8:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
  1011ec:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1011f0:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1011f4:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  1011f5:	0f b7 05 04 ef 10 00 	movzwl 0x10ef04,%eax
  1011fc:	0f b6 c0             	movzbl %al,%eax
  1011ff:	0f b7 15 06 ef 10 00 	movzwl 0x10ef06,%edx
  101206:	83 c2 01             	add    $0x1,%edx
  101209:	0f b7 d2             	movzwl %dx,%edx
  10120c:	66 89 55 e6          	mov    %dx,-0x1a(%ebp)
  101210:	88 45 e5             	mov    %al,-0x1b(%ebp)
  101213:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101217:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10121b:	ee                   	out    %al,(%dx)
}
  10121c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10121f:	c9                   	leave  
  101220:	c3                   	ret    

00101221 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  101221:	55                   	push   %ebp
  101222:	89 e5                	mov    %esp,%ebp
  101224:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101227:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10122e:	eb 09                	jmp    101239 <serial_putc_sub+0x18>
        delay();
  101230:	e8 5b fb ff ff       	call   100d90 <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101235:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101239:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10123f:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101243:	89 c2                	mov    %eax,%edx
  101245:	ec                   	in     (%dx),%al
  101246:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101249:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10124d:	0f b6 c0             	movzbl %al,%eax
  101250:	83 e0 20             	and    $0x20,%eax
  101253:	85 c0                	test   %eax,%eax
  101255:	75 09                	jne    101260 <serial_putc_sub+0x3f>
  101257:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  10125e:	7e d0                	jle    101230 <serial_putc_sub+0xf>
    }
    outb(COM1 + COM_TX, c);
  101260:	8b 45 08             	mov    0x8(%ebp),%eax
  101263:	0f b6 c0             	movzbl %al,%eax
  101266:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  10126c:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10126f:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101273:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101277:	ee                   	out    %al,(%dx)
}
  101278:	c9                   	leave  
  101279:	c3                   	ret    

0010127a <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  10127a:	55                   	push   %ebp
  10127b:	89 e5                	mov    %esp,%ebp
    if (c != '\b') {
  10127d:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101281:	74 0d                	je     101290 <serial_putc+0x16>
        serial_putc_sub(c);
  101283:	ff 75 08             	pushl  0x8(%ebp)
  101286:	e8 96 ff ff ff       	call   101221 <serial_putc_sub>
  10128b:	83 c4 04             	add    $0x4,%esp
  10128e:	eb 1e                	jmp    1012ae <serial_putc+0x34>
    }
    else {
        serial_putc_sub('\b');
  101290:	6a 08                	push   $0x8
  101292:	e8 8a ff ff ff       	call   101221 <serial_putc_sub>
  101297:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub(' ');
  10129a:	6a 20                	push   $0x20
  10129c:	e8 80 ff ff ff       	call   101221 <serial_putc_sub>
  1012a1:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub('\b');
  1012a4:	6a 08                	push   $0x8
  1012a6:	e8 76 ff ff ff       	call   101221 <serial_putc_sub>
  1012ab:	83 c4 04             	add    $0x4,%esp
    }
}
  1012ae:	c9                   	leave  
  1012af:	c3                   	ret    

001012b0 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1012b0:	55                   	push   %ebp
  1012b1:	89 e5                	mov    %esp,%ebp
  1012b3:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  1012b6:	eb 33                	jmp    1012eb <cons_intr+0x3b>
        if (c != 0) {
  1012b8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1012bc:	74 2d                	je     1012eb <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  1012be:	a1 44 f1 10 00       	mov    0x10f144,%eax
  1012c3:	8d 50 01             	lea    0x1(%eax),%edx
  1012c6:	89 15 44 f1 10 00    	mov    %edx,0x10f144
  1012cc:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1012cf:	88 90 40 ef 10 00    	mov    %dl,0x10ef40(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  1012d5:	a1 44 f1 10 00       	mov    0x10f144,%eax
  1012da:	3d 00 02 00 00       	cmp    $0x200,%eax
  1012df:	75 0a                	jne    1012eb <cons_intr+0x3b>
                cons.wpos = 0;
  1012e1:	c7 05 44 f1 10 00 00 	movl   $0x0,0x10f144
  1012e8:	00 00 00 
    while ((c = (*proc)()) != -1) {
  1012eb:	8b 45 08             	mov    0x8(%ebp),%eax
  1012ee:	ff d0                	call   *%eax
  1012f0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1012f3:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  1012f7:	75 bf                	jne    1012b8 <cons_intr+0x8>
            }
        }
    }
}
  1012f9:	c9                   	leave  
  1012fa:	c3                   	ret    

001012fb <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  1012fb:	55                   	push   %ebp
  1012fc:	89 e5                	mov    %esp,%ebp
  1012fe:	83 ec 10             	sub    $0x10,%esp
  101301:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101307:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10130b:	89 c2                	mov    %eax,%edx
  10130d:	ec                   	in     (%dx),%al
  10130e:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101311:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101315:	0f b6 c0             	movzbl %al,%eax
  101318:	83 e0 01             	and    $0x1,%eax
  10131b:	85 c0                	test   %eax,%eax
  10131d:	75 07                	jne    101326 <serial_proc_data+0x2b>
        return -1;
  10131f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101324:	eb 2a                	jmp    101350 <serial_proc_data+0x55>
  101326:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10132c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101330:	89 c2                	mov    %eax,%edx
  101332:	ec                   	in     (%dx),%al
  101333:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  101336:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  10133a:	0f b6 c0             	movzbl %al,%eax
  10133d:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  101340:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  101344:	75 07                	jne    10134d <serial_proc_data+0x52>
        c = '\b';
  101346:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  10134d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  101350:	c9                   	leave  
  101351:	c3                   	ret    

00101352 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  101352:	55                   	push   %ebp
  101353:	89 e5                	mov    %esp,%ebp
  101355:	83 ec 08             	sub    $0x8,%esp
    if (serial_exists) {
  101358:	a1 08 ef 10 00       	mov    0x10ef08,%eax
  10135d:	85 c0                	test   %eax,%eax
  10135f:	74 10                	je     101371 <serial_intr+0x1f>
        cons_intr(serial_proc_data);
  101361:	83 ec 0c             	sub    $0xc,%esp
  101364:	68 fb 12 10 00       	push   $0x1012fb
  101369:	e8 42 ff ff ff       	call   1012b0 <cons_intr>
  10136e:	83 c4 10             	add    $0x10,%esp
    }
}
  101371:	c9                   	leave  
  101372:	c3                   	ret    

00101373 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  101373:	55                   	push   %ebp
  101374:	89 e5                	mov    %esp,%ebp
  101376:	83 ec 28             	sub    $0x28,%esp
  101379:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10137f:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  101383:	89 c2                	mov    %eax,%edx
  101385:	ec                   	in     (%dx),%al
  101386:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  101389:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  10138d:	0f b6 c0             	movzbl %al,%eax
  101390:	83 e0 01             	and    $0x1,%eax
  101393:	85 c0                	test   %eax,%eax
  101395:	75 0a                	jne    1013a1 <kbd_proc_data+0x2e>
        return -1;
  101397:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10139c:	e9 5d 01 00 00       	jmp    1014fe <kbd_proc_data+0x18b>
  1013a1:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013a7:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1013ab:	89 c2                	mov    %eax,%edx
  1013ad:	ec                   	in     (%dx),%al
  1013ae:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1013b1:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  1013b5:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1013b8:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1013bc:	75 17                	jne    1013d5 <kbd_proc_data+0x62>
        // E0 escape character
        shift |= E0ESC;
  1013be:	a1 48 f1 10 00       	mov    0x10f148,%eax
  1013c3:	83 c8 40             	or     $0x40,%eax
  1013c6:	a3 48 f1 10 00       	mov    %eax,0x10f148
        return 0;
  1013cb:	b8 00 00 00 00       	mov    $0x0,%eax
  1013d0:	e9 29 01 00 00       	jmp    1014fe <kbd_proc_data+0x18b>
    } else if (data & 0x80) {
  1013d5:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013d9:	84 c0                	test   %al,%al
  1013db:	79 47                	jns    101424 <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  1013dd:	a1 48 f1 10 00       	mov    0x10f148,%eax
  1013e2:	83 e0 40             	and    $0x40,%eax
  1013e5:	85 c0                	test   %eax,%eax
  1013e7:	75 09                	jne    1013f2 <kbd_proc_data+0x7f>
  1013e9:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013ed:	83 e0 7f             	and    $0x7f,%eax
  1013f0:	eb 04                	jmp    1013f6 <kbd_proc_data+0x83>
  1013f2:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013f6:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  1013f9:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013fd:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101404:	83 c8 40             	or     $0x40,%eax
  101407:	0f b6 c0             	movzbl %al,%eax
  10140a:	f7 d0                	not    %eax
  10140c:	89 c2                	mov    %eax,%edx
  10140e:	a1 48 f1 10 00       	mov    0x10f148,%eax
  101413:	21 d0                	and    %edx,%eax
  101415:	a3 48 f1 10 00       	mov    %eax,0x10f148
        return 0;
  10141a:	b8 00 00 00 00       	mov    $0x0,%eax
  10141f:	e9 da 00 00 00       	jmp    1014fe <kbd_proc_data+0x18b>
    } else if (shift & E0ESC) {
  101424:	a1 48 f1 10 00       	mov    0x10f148,%eax
  101429:	83 e0 40             	and    $0x40,%eax
  10142c:	85 c0                	test   %eax,%eax
  10142e:	74 11                	je     101441 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101430:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101434:	a1 48 f1 10 00       	mov    0x10f148,%eax
  101439:	83 e0 bf             	and    $0xffffffbf,%eax
  10143c:	a3 48 f1 10 00       	mov    %eax,0x10f148
    }

    shift |= shiftcode[data];
  101441:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101445:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  10144c:	0f b6 d0             	movzbl %al,%edx
  10144f:	a1 48 f1 10 00       	mov    0x10f148,%eax
  101454:	09 d0                	or     %edx,%eax
  101456:	a3 48 f1 10 00       	mov    %eax,0x10f148
    shift ^= togglecode[data];
  10145b:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10145f:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  101466:	0f b6 d0             	movzbl %al,%edx
  101469:	a1 48 f1 10 00       	mov    0x10f148,%eax
  10146e:	31 d0                	xor    %edx,%eax
  101470:	a3 48 f1 10 00       	mov    %eax,0x10f148

    c = charcode[shift & (CTL | SHIFT)][data];
  101475:	a1 48 f1 10 00       	mov    0x10f148,%eax
  10147a:	83 e0 03             	and    $0x3,%eax
  10147d:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  101484:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101488:	01 d0                	add    %edx,%eax
  10148a:	0f b6 00             	movzbl (%eax),%eax
  10148d:	0f b6 c0             	movzbl %al,%eax
  101490:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  101493:	a1 48 f1 10 00       	mov    0x10f148,%eax
  101498:	83 e0 08             	and    $0x8,%eax
  10149b:	85 c0                	test   %eax,%eax
  10149d:	74 22                	je     1014c1 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  10149f:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1014a3:	7e 0c                	jle    1014b1 <kbd_proc_data+0x13e>
  1014a5:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1014a9:	7f 06                	jg     1014b1 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1014ab:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1014af:	eb 10                	jmp    1014c1 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1014b1:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1014b5:	7e 0a                	jle    1014c1 <kbd_proc_data+0x14e>
  1014b7:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1014bb:	7f 04                	jg     1014c1 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  1014bd:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  1014c1:	a1 48 f1 10 00       	mov    0x10f148,%eax
  1014c6:	f7 d0                	not    %eax
  1014c8:	83 e0 06             	and    $0x6,%eax
  1014cb:	85 c0                	test   %eax,%eax
  1014cd:	75 2c                	jne    1014fb <kbd_proc_data+0x188>
  1014cf:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  1014d6:	75 23                	jne    1014fb <kbd_proc_data+0x188>
        cprintf("Rebooting!\n");
  1014d8:	83 ec 0c             	sub    $0xc,%esp
  1014db:	68 1d 38 10 00       	push   $0x10381d
  1014e0:	e8 5f ed ff ff       	call   100244 <cprintf>
  1014e5:	83 c4 10             	add    $0x10,%esp
  1014e8:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  1014ee:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1014f2:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  1014f6:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  1014fa:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  1014fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1014fe:	c9                   	leave  
  1014ff:	c3                   	ret    

00101500 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101500:	55                   	push   %ebp
  101501:	89 e5                	mov    %esp,%ebp
  101503:	83 ec 08             	sub    $0x8,%esp
    cons_intr(kbd_proc_data);
  101506:	83 ec 0c             	sub    $0xc,%esp
  101509:	68 73 13 10 00       	push   $0x101373
  10150e:	e8 9d fd ff ff       	call   1012b0 <cons_intr>
  101513:	83 c4 10             	add    $0x10,%esp
}
  101516:	c9                   	leave  
  101517:	c3                   	ret    

00101518 <kbd_init>:

static void
kbd_init(void) {
  101518:	55                   	push   %ebp
  101519:	89 e5                	mov    %esp,%ebp
  10151b:	83 ec 08             	sub    $0x8,%esp
    // drain the kbd buffer
    kbd_intr();
  10151e:	e8 dd ff ff ff       	call   101500 <kbd_intr>
    pic_enable(IRQ_KBD);
  101523:	83 ec 0c             	sub    $0xc,%esp
  101526:	6a 01                	push   $0x1
  101528:	e8 18 01 00 00       	call   101645 <pic_enable>
  10152d:	83 c4 10             	add    $0x10,%esp
}
  101530:	c9                   	leave  
  101531:	c3                   	ret    

00101532 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101532:	55                   	push   %ebp
  101533:	89 e5                	mov    %esp,%ebp
  101535:	83 ec 08             	sub    $0x8,%esp
    cga_init();
  101538:	e8 9b f8 ff ff       	call   100dd8 <cga_init>
    serial_init();
  10153d:	e8 7c f9 ff ff       	call   100ebe <serial_init>
    kbd_init();
  101542:	e8 d1 ff ff ff       	call   101518 <kbd_init>
    if (!serial_exists) {
  101547:	a1 08 ef 10 00       	mov    0x10ef08,%eax
  10154c:	85 c0                	test   %eax,%eax
  10154e:	75 10                	jne    101560 <cons_init+0x2e>
        cprintf("serial port does not exist!!\n");
  101550:	83 ec 0c             	sub    $0xc,%esp
  101553:	68 29 38 10 00       	push   $0x103829
  101558:	e8 e7 ec ff ff       	call   100244 <cprintf>
  10155d:	83 c4 10             	add    $0x10,%esp
    }
}
  101560:	c9                   	leave  
  101561:	c3                   	ret    

00101562 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  101562:	55                   	push   %ebp
  101563:	89 e5                	mov    %esp,%ebp
  101565:	83 ec 08             	sub    $0x8,%esp
    lpt_putc(c);
  101568:	ff 75 08             	pushl  0x8(%ebp)
  10156b:	e8 ab fa ff ff       	call   10101b <lpt_putc>
  101570:	83 c4 04             	add    $0x4,%esp
    cga_putc(c);
  101573:	83 ec 0c             	sub    $0xc,%esp
  101576:	ff 75 08             	pushl  0x8(%ebp)
  101579:	e8 d3 fa ff ff       	call   101051 <cga_putc>
  10157e:	83 c4 10             	add    $0x10,%esp
    serial_putc(c);
  101581:	83 ec 0c             	sub    $0xc,%esp
  101584:	ff 75 08             	pushl  0x8(%ebp)
  101587:	e8 ee fc ff ff       	call   10127a <serial_putc>
  10158c:	83 c4 10             	add    $0x10,%esp
}
  10158f:	c9                   	leave  
  101590:	c3                   	ret    

00101591 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  101591:	55                   	push   %ebp
  101592:	89 e5                	mov    %esp,%ebp
  101594:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  101597:	e8 b6 fd ff ff       	call   101352 <serial_intr>
    kbd_intr();
  10159c:	e8 5f ff ff ff       	call   101500 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015a1:	8b 15 40 f1 10 00    	mov    0x10f140,%edx
  1015a7:	a1 44 f1 10 00       	mov    0x10f144,%eax
  1015ac:	39 c2                	cmp    %eax,%edx
  1015ae:	74 36                	je     1015e6 <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  1015b0:	a1 40 f1 10 00       	mov    0x10f140,%eax
  1015b5:	8d 50 01             	lea    0x1(%eax),%edx
  1015b8:	89 15 40 f1 10 00    	mov    %edx,0x10f140
  1015be:	0f b6 80 40 ef 10 00 	movzbl 0x10ef40(%eax),%eax
  1015c5:	0f b6 c0             	movzbl %al,%eax
  1015c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1015cb:	a1 40 f1 10 00       	mov    0x10f140,%eax
  1015d0:	3d 00 02 00 00       	cmp    $0x200,%eax
  1015d5:	75 0a                	jne    1015e1 <cons_getc+0x50>
            cons.rpos = 0;
  1015d7:	c7 05 40 f1 10 00 00 	movl   $0x0,0x10f140
  1015de:	00 00 00 
        }
        return c;
  1015e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1015e4:	eb 05                	jmp    1015eb <cons_getc+0x5a>
    }
    return 0;
  1015e6:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1015eb:	c9                   	leave  
  1015ec:	c3                   	ret    

001015ed <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  1015ed:	55                   	push   %ebp
  1015ee:	89 e5                	mov    %esp,%ebp
  1015f0:	83 ec 14             	sub    $0x14,%esp
  1015f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1015f6:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  1015fa:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1015fe:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  101604:	a1 4c f1 10 00       	mov    0x10f14c,%eax
  101609:	85 c0                	test   %eax,%eax
  10160b:	74 36                	je     101643 <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  10160d:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101611:	0f b6 c0             	movzbl %al,%eax
  101614:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  10161a:	88 45 fd             	mov    %al,-0x3(%ebp)
  10161d:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101621:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101625:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  101626:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10162a:	66 c1 e8 08          	shr    $0x8,%ax
  10162e:	0f b6 c0             	movzbl %al,%eax
  101631:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  101637:	88 45 f9             	mov    %al,-0x7(%ebp)
  10163a:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10163e:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101642:	ee                   	out    %al,(%dx)
    }
}
  101643:	c9                   	leave  
  101644:	c3                   	ret    

00101645 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101645:	55                   	push   %ebp
  101646:	89 e5                	mov    %esp,%ebp
    pic_setmask(irq_mask & ~(1 << irq));
  101648:	8b 45 08             	mov    0x8(%ebp),%eax
  10164b:	ba 01 00 00 00       	mov    $0x1,%edx
  101650:	89 c1                	mov    %eax,%ecx
  101652:	d3 e2                	shl    %cl,%edx
  101654:	89 d0                	mov    %edx,%eax
  101656:	f7 d0                	not    %eax
  101658:	89 c2                	mov    %eax,%edx
  10165a:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  101661:	21 d0                	and    %edx,%eax
  101663:	0f b7 c0             	movzwl %ax,%eax
  101666:	50                   	push   %eax
  101667:	e8 81 ff ff ff       	call   1015ed <pic_setmask>
  10166c:	83 c4 04             	add    $0x4,%esp
}
  10166f:	c9                   	leave  
  101670:	c3                   	ret    

00101671 <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  101671:	55                   	push   %ebp
  101672:	89 e5                	mov    %esp,%ebp
  101674:	83 ec 40             	sub    $0x40,%esp
    did_init = 1;
  101677:	c7 05 4c f1 10 00 01 	movl   $0x1,0x10f14c
  10167e:	00 00 00 
  101681:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  101687:	c6 45 fd ff          	movb   $0xff,-0x3(%ebp)
  10168b:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  10168f:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101693:	ee                   	out    %al,(%dx)
  101694:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  10169a:	c6 45 f9 ff          	movb   $0xff,-0x7(%ebp)
  10169e:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1016a2:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1016a6:	ee                   	out    %al,(%dx)
  1016a7:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  1016ad:	c6 45 f5 11          	movb   $0x11,-0xb(%ebp)
  1016b1:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1016b5:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1016b9:	ee                   	out    %al,(%dx)
  1016ba:	66 c7 45 f2 21 00    	movw   $0x21,-0xe(%ebp)
  1016c0:	c6 45 f1 20          	movb   $0x20,-0xf(%ebp)
  1016c4:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1016c8:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1016cc:	ee                   	out    %al,(%dx)
  1016cd:	66 c7 45 ee 21 00    	movw   $0x21,-0x12(%ebp)
  1016d3:	c6 45 ed 04          	movb   $0x4,-0x13(%ebp)
  1016d7:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1016db:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1016df:	ee                   	out    %al,(%dx)
  1016e0:	66 c7 45 ea 21 00    	movw   $0x21,-0x16(%ebp)
  1016e6:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
  1016ea:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1016ee:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1016f2:	ee                   	out    %al,(%dx)
  1016f3:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  1016f9:	c6 45 e5 11          	movb   $0x11,-0x1b(%ebp)
  1016fd:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101701:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101705:	ee                   	out    %al,(%dx)
  101706:	66 c7 45 e2 a1 00    	movw   $0xa1,-0x1e(%ebp)
  10170c:	c6 45 e1 28          	movb   $0x28,-0x1f(%ebp)
  101710:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101714:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101718:	ee                   	out    %al,(%dx)
  101719:	66 c7 45 de a1 00    	movw   $0xa1,-0x22(%ebp)
  10171f:	c6 45 dd 02          	movb   $0x2,-0x23(%ebp)
  101723:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101727:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  10172b:	ee                   	out    %al,(%dx)
  10172c:	66 c7 45 da a1 00    	movw   $0xa1,-0x26(%ebp)
  101732:	c6 45 d9 03          	movb   $0x3,-0x27(%ebp)
  101736:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  10173a:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  10173e:	ee                   	out    %al,(%dx)
  10173f:	66 c7 45 d6 20 00    	movw   $0x20,-0x2a(%ebp)
  101745:	c6 45 d5 68          	movb   $0x68,-0x2b(%ebp)
  101749:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  10174d:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  101751:	ee                   	out    %al,(%dx)
  101752:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  101758:	c6 45 d1 0a          	movb   $0xa,-0x2f(%ebp)
  10175c:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  101760:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  101764:	ee                   	out    %al,(%dx)
  101765:	66 c7 45 ce a0 00    	movw   $0xa0,-0x32(%ebp)
  10176b:	c6 45 cd 68          	movb   $0x68,-0x33(%ebp)
  10176f:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  101773:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  101777:	ee                   	out    %al,(%dx)
  101778:	66 c7 45 ca a0 00    	movw   $0xa0,-0x36(%ebp)
  10177e:	c6 45 c9 0a          	movb   $0xa,-0x37(%ebp)
  101782:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  101786:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  10178a:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  10178b:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  101792:	66 83 f8 ff          	cmp    $0xffff,%ax
  101796:	74 13                	je     1017ab <pic_init+0x13a>
        pic_setmask(irq_mask);
  101798:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  10179f:	0f b7 c0             	movzwl %ax,%eax
  1017a2:	50                   	push   %eax
  1017a3:	e8 45 fe ff ff       	call   1015ed <pic_setmask>
  1017a8:	83 c4 04             	add    $0x4,%esp
    }
}
  1017ab:	c9                   	leave  
  1017ac:	c3                   	ret    

001017ad <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1017ad:	55                   	push   %ebp
  1017ae:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1017b0:	fb                   	sti    
    sti();
}
  1017b1:	5d                   	pop    %ebp
  1017b2:	c3                   	ret    

001017b3 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1017b3:	55                   	push   %ebp
  1017b4:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  1017b6:	fa                   	cli    
    cli();
}
  1017b7:	5d                   	pop    %ebp
  1017b8:	c3                   	ret    

001017b9 <print_ticks>:
#include <console.h>
#include <kdebug.h>
#include <string.h>
#define TICK_NUM 100

static void print_ticks() {
  1017b9:	55                   	push   %ebp
  1017ba:	89 e5                	mov    %esp,%ebp
  1017bc:	83 ec 08             	sub    $0x8,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1017bf:	83 ec 08             	sub    $0x8,%esp
  1017c2:	6a 64                	push   $0x64
  1017c4:	68 80 38 10 00       	push   $0x103880
  1017c9:	e8 76 ea ff ff       	call   100244 <cprintf>
  1017ce:	83 c4 10             	add    $0x10,%esp
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  1017d1:	c9                   	leave  
  1017d2:	c3                   	ret    

001017d3 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  1017d3:	55                   	push   %ebp
  1017d4:	89 e5                	mov    %esp,%ebp
  1017d6:	83 ec 10             	sub    $0x10,%esp
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
    extern uintptr_t __vectors[];
    int i;
    for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i ++) {
  1017d9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1017e0:	e9 c3 00 00 00       	jmp    1018a8 <idt_init+0xd5>
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
  1017e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1017e8:	8b 04 85 20 e6 10 00 	mov    0x10e620(,%eax,4),%eax
  1017ef:	89 c2                	mov    %eax,%edx
  1017f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1017f4:	66 89 14 c5 80 f1 10 	mov    %dx,0x10f180(,%eax,8)
  1017fb:	00 
  1017fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1017ff:	66 c7 04 c5 82 f1 10 	movw   $0x8,0x10f182(,%eax,8)
  101806:	00 08 00 
  101809:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10180c:	0f b6 14 c5 84 f1 10 	movzbl 0x10f184(,%eax,8),%edx
  101813:	00 
  101814:	83 e2 e0             	and    $0xffffffe0,%edx
  101817:	88 14 c5 84 f1 10 00 	mov    %dl,0x10f184(,%eax,8)
  10181e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101821:	0f b6 14 c5 84 f1 10 	movzbl 0x10f184(,%eax,8),%edx
  101828:	00 
  101829:	83 e2 1f             	and    $0x1f,%edx
  10182c:	88 14 c5 84 f1 10 00 	mov    %dl,0x10f184(,%eax,8)
  101833:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101836:	0f b6 14 c5 85 f1 10 	movzbl 0x10f185(,%eax,8),%edx
  10183d:	00 
  10183e:	83 e2 f0             	and    $0xfffffff0,%edx
  101841:	83 ca 0e             	or     $0xe,%edx
  101844:	88 14 c5 85 f1 10 00 	mov    %dl,0x10f185(,%eax,8)
  10184b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10184e:	0f b6 14 c5 85 f1 10 	movzbl 0x10f185(,%eax,8),%edx
  101855:	00 
  101856:	83 e2 ef             	and    $0xffffffef,%edx
  101859:	88 14 c5 85 f1 10 00 	mov    %dl,0x10f185(,%eax,8)
  101860:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101863:	0f b6 14 c5 85 f1 10 	movzbl 0x10f185(,%eax,8),%edx
  10186a:	00 
  10186b:	83 e2 9f             	and    $0xffffff9f,%edx
  10186e:	88 14 c5 85 f1 10 00 	mov    %dl,0x10f185(,%eax,8)
  101875:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101878:	0f b6 14 c5 85 f1 10 	movzbl 0x10f185(,%eax,8),%edx
  10187f:	00 
  101880:	83 ca 80             	or     $0xffffff80,%edx
  101883:	88 14 c5 85 f1 10 00 	mov    %dl,0x10f185(,%eax,8)
  10188a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10188d:	8b 04 85 20 e6 10 00 	mov    0x10e620(,%eax,4),%eax
  101894:	c1 e8 10             	shr    $0x10,%eax
  101897:	89 c2                	mov    %eax,%edx
  101899:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10189c:	66 89 14 c5 86 f1 10 	mov    %dx,0x10f186(,%eax,8)
  1018a3:	00 
    for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i ++) {
  1018a4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1018a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018ab:	3d ff 00 00 00       	cmp    $0xff,%eax
  1018b0:	0f 86 2f ff ff ff    	jbe    1017e5 <idt_init+0x12>
    }
	// set for switch from user to kernel
    SETGATE(idt[T_SWITCH_TOK], 0, GD_KTEXT, __vectors[T_SWITCH_TOK], DPL_USER);
  1018b6:	a1 04 e8 10 00       	mov    0x10e804,%eax
  1018bb:	66 a3 48 f5 10 00    	mov    %ax,0x10f548
  1018c1:	66 c7 05 4a f5 10 00 	movw   $0x8,0x10f54a
  1018c8:	08 00 
  1018ca:	0f b6 05 4c f5 10 00 	movzbl 0x10f54c,%eax
  1018d1:	83 e0 e0             	and    $0xffffffe0,%eax
  1018d4:	a2 4c f5 10 00       	mov    %al,0x10f54c
  1018d9:	0f b6 05 4c f5 10 00 	movzbl 0x10f54c,%eax
  1018e0:	83 e0 1f             	and    $0x1f,%eax
  1018e3:	a2 4c f5 10 00       	mov    %al,0x10f54c
  1018e8:	0f b6 05 4d f5 10 00 	movzbl 0x10f54d,%eax
  1018ef:	83 e0 f0             	and    $0xfffffff0,%eax
  1018f2:	83 c8 0e             	or     $0xe,%eax
  1018f5:	a2 4d f5 10 00       	mov    %al,0x10f54d
  1018fa:	0f b6 05 4d f5 10 00 	movzbl 0x10f54d,%eax
  101901:	83 e0 ef             	and    $0xffffffef,%eax
  101904:	a2 4d f5 10 00       	mov    %al,0x10f54d
  101909:	0f b6 05 4d f5 10 00 	movzbl 0x10f54d,%eax
  101910:	83 c8 60             	or     $0x60,%eax
  101913:	a2 4d f5 10 00       	mov    %al,0x10f54d
  101918:	0f b6 05 4d f5 10 00 	movzbl 0x10f54d,%eax
  10191f:	83 c8 80             	or     $0xffffff80,%eax
  101922:	a2 4d f5 10 00       	mov    %al,0x10f54d
  101927:	a1 04 e8 10 00       	mov    0x10e804,%eax
  10192c:	c1 e8 10             	shr    $0x10,%eax
  10192f:	66 a3 4e f5 10 00    	mov    %ax,0x10f54e
  101935:	c7 45 f8 80 e5 10 00 	movl   $0x10e580,-0x8(%ebp)
    asm volatile ("lidt (%0)" :: "r" (pd));
  10193c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10193f:	0f 01 18             	lidtl  (%eax)
	// load the IDT
    lidt(&idt_pd);
}
  101942:	c9                   	leave  
  101943:	c3                   	ret    

00101944 <trapname>:

static const char *
trapname(int trapno) {
  101944:	55                   	push   %ebp
  101945:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101947:	8b 45 08             	mov    0x8(%ebp),%eax
  10194a:	83 f8 13             	cmp    $0x13,%eax
  10194d:	77 0c                	ja     10195b <trapname+0x17>
        return excnames[trapno];
  10194f:	8b 45 08             	mov    0x8(%ebp),%eax
  101952:	8b 04 85 00 3c 10 00 	mov    0x103c00(,%eax,4),%eax
  101959:	eb 18                	jmp    101973 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  10195b:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  10195f:	7e 0d                	jle    10196e <trapname+0x2a>
  101961:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101965:	7f 07                	jg     10196e <trapname+0x2a>
        return "Hardware Interrupt";
  101967:	b8 8a 38 10 00       	mov    $0x10388a,%eax
  10196c:	eb 05                	jmp    101973 <trapname+0x2f>
    }
    return "(unknown trap)";
  10196e:	b8 9d 38 10 00       	mov    $0x10389d,%eax
}
  101973:	5d                   	pop    %ebp
  101974:	c3                   	ret    

00101975 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101975:	55                   	push   %ebp
  101976:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101978:	8b 45 08             	mov    0x8(%ebp),%eax
  10197b:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  10197f:	66 83 f8 08          	cmp    $0x8,%ax
  101983:	0f 94 c0             	sete   %al
  101986:	0f b6 c0             	movzbl %al,%eax
}
  101989:	5d                   	pop    %ebp
  10198a:	c3                   	ret    

0010198b <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  10198b:	55                   	push   %ebp
  10198c:	89 e5                	mov    %esp,%ebp
  10198e:	83 ec 18             	sub    $0x18,%esp
    cprintf("trapframe at %p\n", tf);
  101991:	83 ec 08             	sub    $0x8,%esp
  101994:	ff 75 08             	pushl  0x8(%ebp)
  101997:	68 de 38 10 00       	push   $0x1038de
  10199c:	e8 a3 e8 ff ff       	call   100244 <cprintf>
  1019a1:	83 c4 10             	add    $0x10,%esp
    print_regs(&tf->tf_regs);
  1019a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1019a7:	83 ec 0c             	sub    $0xc,%esp
  1019aa:	50                   	push   %eax
  1019ab:	e8 b7 01 00 00       	call   101b67 <print_regs>
  1019b0:	83 c4 10             	add    $0x10,%esp
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  1019b3:	8b 45 08             	mov    0x8(%ebp),%eax
  1019b6:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  1019ba:	0f b7 c0             	movzwl %ax,%eax
  1019bd:	83 ec 08             	sub    $0x8,%esp
  1019c0:	50                   	push   %eax
  1019c1:	68 ef 38 10 00       	push   $0x1038ef
  1019c6:	e8 79 e8 ff ff       	call   100244 <cprintf>
  1019cb:	83 c4 10             	add    $0x10,%esp
    cprintf("  es   0x----%04x\n", tf->tf_es);
  1019ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1019d1:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  1019d5:	0f b7 c0             	movzwl %ax,%eax
  1019d8:	83 ec 08             	sub    $0x8,%esp
  1019db:	50                   	push   %eax
  1019dc:	68 02 39 10 00       	push   $0x103902
  1019e1:	e8 5e e8 ff ff       	call   100244 <cprintf>
  1019e6:	83 c4 10             	add    $0x10,%esp
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  1019e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1019ec:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  1019f0:	0f b7 c0             	movzwl %ax,%eax
  1019f3:	83 ec 08             	sub    $0x8,%esp
  1019f6:	50                   	push   %eax
  1019f7:	68 15 39 10 00       	push   $0x103915
  1019fc:	e8 43 e8 ff ff       	call   100244 <cprintf>
  101a01:	83 c4 10             	add    $0x10,%esp
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101a04:	8b 45 08             	mov    0x8(%ebp),%eax
  101a07:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101a0b:	0f b7 c0             	movzwl %ax,%eax
  101a0e:	83 ec 08             	sub    $0x8,%esp
  101a11:	50                   	push   %eax
  101a12:	68 28 39 10 00       	push   $0x103928
  101a17:	e8 28 e8 ff ff       	call   100244 <cprintf>
  101a1c:	83 c4 10             	add    $0x10,%esp
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101a1f:	8b 45 08             	mov    0x8(%ebp),%eax
  101a22:	8b 40 30             	mov    0x30(%eax),%eax
  101a25:	83 ec 0c             	sub    $0xc,%esp
  101a28:	50                   	push   %eax
  101a29:	e8 16 ff ff ff       	call   101944 <trapname>
  101a2e:	83 c4 10             	add    $0x10,%esp
  101a31:	89 c2                	mov    %eax,%edx
  101a33:	8b 45 08             	mov    0x8(%ebp),%eax
  101a36:	8b 40 30             	mov    0x30(%eax),%eax
  101a39:	83 ec 04             	sub    $0x4,%esp
  101a3c:	52                   	push   %edx
  101a3d:	50                   	push   %eax
  101a3e:	68 3b 39 10 00       	push   $0x10393b
  101a43:	e8 fc e7 ff ff       	call   100244 <cprintf>
  101a48:	83 c4 10             	add    $0x10,%esp
    cprintf("  err  0x%08x\n", tf->tf_err);
  101a4b:	8b 45 08             	mov    0x8(%ebp),%eax
  101a4e:	8b 40 34             	mov    0x34(%eax),%eax
  101a51:	83 ec 08             	sub    $0x8,%esp
  101a54:	50                   	push   %eax
  101a55:	68 4d 39 10 00       	push   $0x10394d
  101a5a:	e8 e5 e7 ff ff       	call   100244 <cprintf>
  101a5f:	83 c4 10             	add    $0x10,%esp
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101a62:	8b 45 08             	mov    0x8(%ebp),%eax
  101a65:	8b 40 38             	mov    0x38(%eax),%eax
  101a68:	83 ec 08             	sub    $0x8,%esp
  101a6b:	50                   	push   %eax
  101a6c:	68 5c 39 10 00       	push   $0x10395c
  101a71:	e8 ce e7 ff ff       	call   100244 <cprintf>
  101a76:	83 c4 10             	add    $0x10,%esp
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101a79:	8b 45 08             	mov    0x8(%ebp),%eax
  101a7c:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101a80:	0f b7 c0             	movzwl %ax,%eax
  101a83:	83 ec 08             	sub    $0x8,%esp
  101a86:	50                   	push   %eax
  101a87:	68 6b 39 10 00       	push   $0x10396b
  101a8c:	e8 b3 e7 ff ff       	call   100244 <cprintf>
  101a91:	83 c4 10             	add    $0x10,%esp
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101a94:	8b 45 08             	mov    0x8(%ebp),%eax
  101a97:	8b 40 40             	mov    0x40(%eax),%eax
  101a9a:	83 ec 08             	sub    $0x8,%esp
  101a9d:	50                   	push   %eax
  101a9e:	68 7e 39 10 00       	push   $0x10397e
  101aa3:	e8 9c e7 ff ff       	call   100244 <cprintf>
  101aa8:	83 c4 10             	add    $0x10,%esp

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101aab:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101ab2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101ab9:	eb 3f                	jmp    101afa <print_trapframe+0x16f>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101abb:	8b 45 08             	mov    0x8(%ebp),%eax
  101abe:	8b 50 40             	mov    0x40(%eax),%edx
  101ac1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101ac4:	21 d0                	and    %edx,%eax
  101ac6:	85 c0                	test   %eax,%eax
  101ac8:	74 29                	je     101af3 <print_trapframe+0x168>
  101aca:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101acd:	8b 04 85 c0 e5 10 00 	mov    0x10e5c0(,%eax,4),%eax
  101ad4:	85 c0                	test   %eax,%eax
  101ad6:	74 1b                	je     101af3 <print_trapframe+0x168>
            cprintf("%s,", IA32flags[i]);
  101ad8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101adb:	8b 04 85 c0 e5 10 00 	mov    0x10e5c0(,%eax,4),%eax
  101ae2:	83 ec 08             	sub    $0x8,%esp
  101ae5:	50                   	push   %eax
  101ae6:	68 8d 39 10 00       	push   $0x10398d
  101aeb:	e8 54 e7 ff ff       	call   100244 <cprintf>
  101af0:	83 c4 10             	add    $0x10,%esp
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101af3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101af7:	d1 65 f0             	shll   -0x10(%ebp)
  101afa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101afd:	83 f8 17             	cmp    $0x17,%eax
  101b00:	76 b9                	jbe    101abb <print_trapframe+0x130>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101b02:	8b 45 08             	mov    0x8(%ebp),%eax
  101b05:	8b 40 40             	mov    0x40(%eax),%eax
  101b08:	25 00 30 00 00       	and    $0x3000,%eax
  101b0d:	c1 e8 0c             	shr    $0xc,%eax
  101b10:	83 ec 08             	sub    $0x8,%esp
  101b13:	50                   	push   %eax
  101b14:	68 91 39 10 00       	push   $0x103991
  101b19:	e8 26 e7 ff ff       	call   100244 <cprintf>
  101b1e:	83 c4 10             	add    $0x10,%esp

    if (!trap_in_kernel(tf)) {
  101b21:	83 ec 0c             	sub    $0xc,%esp
  101b24:	ff 75 08             	pushl  0x8(%ebp)
  101b27:	e8 49 fe ff ff       	call   101975 <trap_in_kernel>
  101b2c:	83 c4 10             	add    $0x10,%esp
  101b2f:	85 c0                	test   %eax,%eax
  101b31:	75 32                	jne    101b65 <print_trapframe+0x1da>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101b33:	8b 45 08             	mov    0x8(%ebp),%eax
  101b36:	8b 40 44             	mov    0x44(%eax),%eax
  101b39:	83 ec 08             	sub    $0x8,%esp
  101b3c:	50                   	push   %eax
  101b3d:	68 9a 39 10 00       	push   $0x10399a
  101b42:	e8 fd e6 ff ff       	call   100244 <cprintf>
  101b47:	83 c4 10             	add    $0x10,%esp
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101b4a:	8b 45 08             	mov    0x8(%ebp),%eax
  101b4d:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101b51:	0f b7 c0             	movzwl %ax,%eax
  101b54:	83 ec 08             	sub    $0x8,%esp
  101b57:	50                   	push   %eax
  101b58:	68 a9 39 10 00       	push   $0x1039a9
  101b5d:	e8 e2 e6 ff ff       	call   100244 <cprintf>
  101b62:	83 c4 10             	add    $0x10,%esp
    }
}
  101b65:	c9                   	leave  
  101b66:	c3                   	ret    

00101b67 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101b67:	55                   	push   %ebp
  101b68:	89 e5                	mov    %esp,%ebp
  101b6a:	83 ec 08             	sub    $0x8,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101b6d:	8b 45 08             	mov    0x8(%ebp),%eax
  101b70:	8b 00                	mov    (%eax),%eax
  101b72:	83 ec 08             	sub    $0x8,%esp
  101b75:	50                   	push   %eax
  101b76:	68 bc 39 10 00       	push   $0x1039bc
  101b7b:	e8 c4 e6 ff ff       	call   100244 <cprintf>
  101b80:	83 c4 10             	add    $0x10,%esp
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101b83:	8b 45 08             	mov    0x8(%ebp),%eax
  101b86:	8b 40 04             	mov    0x4(%eax),%eax
  101b89:	83 ec 08             	sub    $0x8,%esp
  101b8c:	50                   	push   %eax
  101b8d:	68 cb 39 10 00       	push   $0x1039cb
  101b92:	e8 ad e6 ff ff       	call   100244 <cprintf>
  101b97:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101b9a:	8b 45 08             	mov    0x8(%ebp),%eax
  101b9d:	8b 40 08             	mov    0x8(%eax),%eax
  101ba0:	83 ec 08             	sub    $0x8,%esp
  101ba3:	50                   	push   %eax
  101ba4:	68 da 39 10 00       	push   $0x1039da
  101ba9:	e8 96 e6 ff ff       	call   100244 <cprintf>
  101bae:	83 c4 10             	add    $0x10,%esp
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101bb1:	8b 45 08             	mov    0x8(%ebp),%eax
  101bb4:	8b 40 0c             	mov    0xc(%eax),%eax
  101bb7:	83 ec 08             	sub    $0x8,%esp
  101bba:	50                   	push   %eax
  101bbb:	68 e9 39 10 00       	push   $0x1039e9
  101bc0:	e8 7f e6 ff ff       	call   100244 <cprintf>
  101bc5:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101bc8:	8b 45 08             	mov    0x8(%ebp),%eax
  101bcb:	8b 40 10             	mov    0x10(%eax),%eax
  101bce:	83 ec 08             	sub    $0x8,%esp
  101bd1:	50                   	push   %eax
  101bd2:	68 f8 39 10 00       	push   $0x1039f8
  101bd7:	e8 68 e6 ff ff       	call   100244 <cprintf>
  101bdc:	83 c4 10             	add    $0x10,%esp
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101bdf:	8b 45 08             	mov    0x8(%ebp),%eax
  101be2:	8b 40 14             	mov    0x14(%eax),%eax
  101be5:	83 ec 08             	sub    $0x8,%esp
  101be8:	50                   	push   %eax
  101be9:	68 07 3a 10 00       	push   $0x103a07
  101bee:	e8 51 e6 ff ff       	call   100244 <cprintf>
  101bf3:	83 c4 10             	add    $0x10,%esp
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101bf6:	8b 45 08             	mov    0x8(%ebp),%eax
  101bf9:	8b 40 18             	mov    0x18(%eax),%eax
  101bfc:	83 ec 08             	sub    $0x8,%esp
  101bff:	50                   	push   %eax
  101c00:	68 16 3a 10 00       	push   $0x103a16
  101c05:	e8 3a e6 ff ff       	call   100244 <cprintf>
  101c0a:	83 c4 10             	add    $0x10,%esp
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101c0d:	8b 45 08             	mov    0x8(%ebp),%eax
  101c10:	8b 40 1c             	mov    0x1c(%eax),%eax
  101c13:	83 ec 08             	sub    $0x8,%esp
  101c16:	50                   	push   %eax
  101c17:	68 25 3a 10 00       	push   $0x103a25
  101c1c:	e8 23 e6 ff ff       	call   100244 <cprintf>
  101c21:	83 c4 10             	add    $0x10,%esp
}
  101c24:	c9                   	leave  
  101c25:	c3                   	ret    

00101c26 <trap_dispatch>:
/* temporary trapframe or pointer to trapframe */
struct trapframe switchk2u, *switchu2k;

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101c26:	55                   	push   %ebp
  101c27:	89 e5                	mov    %esp,%ebp
  101c29:	57                   	push   %edi
  101c2a:	56                   	push   %esi
  101c2b:	53                   	push   %ebx
  101c2c:	83 ec 1c             	sub    $0x1c,%esp
    char c;

    switch (tf->tf_trapno) {
  101c2f:	8b 45 08             	mov    0x8(%ebp),%eax
  101c32:	8b 40 30             	mov    0x30(%eax),%eax
  101c35:	83 f8 2f             	cmp    $0x2f,%eax
  101c38:	77 21                	ja     101c5b <trap_dispatch+0x35>
  101c3a:	83 f8 2e             	cmp    $0x2e,%eax
  101c3d:	0f 83 03 02 00 00    	jae    101e46 <trap_dispatch+0x220>
  101c43:	83 f8 21             	cmp    $0x21,%eax
  101c46:	0f 84 88 00 00 00    	je     101cd4 <trap_dispatch+0xae>
  101c4c:	83 f8 24             	cmp    $0x24,%eax
  101c4f:	74 5c                	je     101cad <trap_dispatch+0x87>
  101c51:	83 f8 20             	cmp    $0x20,%eax
  101c54:	74 1c                	je     101c72 <trap_dispatch+0x4c>
  101c56:	e9 b5 01 00 00       	jmp    101e10 <trap_dispatch+0x1ea>
  101c5b:	83 f8 78             	cmp    $0x78,%eax
  101c5e:	0f 84 97 00 00 00    	je     101cfb <trap_dispatch+0xd5>
  101c64:	83 f8 79             	cmp    $0x79,%eax
  101c67:	0f 84 2f 01 00 00    	je     101d9c <trap_dispatch+0x176>
  101c6d:	e9 9e 01 00 00       	jmp    101e10 <trap_dispatch+0x1ea>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        ticks ++;
  101c72:	a1 e8 f9 10 00       	mov    0x10f9e8,%eax
  101c77:	83 c0 01             	add    $0x1,%eax
  101c7a:	a3 e8 f9 10 00       	mov    %eax,0x10f9e8
        if (ticks % TICK_NUM == 0) {
  101c7f:	8b 0d e8 f9 10 00    	mov    0x10f9e8,%ecx
  101c85:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101c8a:	89 c8                	mov    %ecx,%eax
  101c8c:	f7 e2                	mul    %edx
  101c8e:	89 d0                	mov    %edx,%eax
  101c90:	c1 e8 05             	shr    $0x5,%eax
  101c93:	6b c0 64             	imul   $0x64,%eax,%eax
  101c96:	29 c1                	sub    %eax,%ecx
  101c98:	89 c8                	mov    %ecx,%eax
  101c9a:	85 c0                	test   %eax,%eax
  101c9c:	75 0a                	jne    101ca8 <trap_dispatch+0x82>
            print_ticks();
  101c9e:	e8 16 fb ff ff       	call   1017b9 <print_ticks>
        }
        break;
  101ca3:	e9 9f 01 00 00       	jmp    101e47 <trap_dispatch+0x221>
  101ca8:	e9 9a 01 00 00       	jmp    101e47 <trap_dispatch+0x221>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101cad:	e8 df f8 ff ff       	call   101591 <cons_getc>
  101cb2:	88 45 e7             	mov    %al,-0x19(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101cb5:	0f be 55 e7          	movsbl -0x19(%ebp),%edx
  101cb9:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
  101cbd:	83 ec 04             	sub    $0x4,%esp
  101cc0:	52                   	push   %edx
  101cc1:	50                   	push   %eax
  101cc2:	68 34 3a 10 00       	push   $0x103a34
  101cc7:	e8 78 e5 ff ff       	call   100244 <cprintf>
  101ccc:	83 c4 10             	add    $0x10,%esp
        break;
  101ccf:	e9 73 01 00 00       	jmp    101e47 <trap_dispatch+0x221>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101cd4:	e8 b8 f8 ff ff       	call   101591 <cons_getc>
  101cd9:	88 45 e7             	mov    %al,-0x19(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101cdc:	0f be 55 e7          	movsbl -0x19(%ebp),%edx
  101ce0:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
  101ce4:	83 ec 04             	sub    $0x4,%esp
  101ce7:	52                   	push   %edx
  101ce8:	50                   	push   %eax
  101ce9:	68 46 3a 10 00       	push   $0x103a46
  101cee:	e8 51 e5 ff ff       	call   100244 <cprintf>
  101cf3:	83 c4 10             	add    $0x10,%esp
        break;
  101cf6:	e9 4c 01 00 00       	jmp    101e47 <trap_dispatch+0x221>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
        if (tf->tf_cs != USER_CS) {
  101cfb:	8b 45 08             	mov    0x8(%ebp),%eax
  101cfe:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101d02:	66 83 f8 1b          	cmp    $0x1b,%ax
  101d06:	0f 84 8b 00 00 00    	je     101d97 <trap_dispatch+0x171>
            switchk2u = *tf;
  101d0c:	8b 55 08             	mov    0x8(%ebp),%edx
  101d0f:	b8 00 fa 10 00       	mov    $0x10fa00,%eax
  101d14:	89 d3                	mov    %edx,%ebx
  101d16:	ba 4c 00 00 00       	mov    $0x4c,%edx
  101d1b:	8b 0b                	mov    (%ebx),%ecx
  101d1d:	89 08                	mov    %ecx,(%eax)
  101d1f:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
  101d23:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
  101d27:	8d 78 04             	lea    0x4(%eax),%edi
  101d2a:	83 e7 fc             	and    $0xfffffffc,%edi
  101d2d:	29 f8                	sub    %edi,%eax
  101d2f:	29 c3                	sub    %eax,%ebx
  101d31:	01 c2                	add    %eax,%edx
  101d33:	83 e2 fc             	and    $0xfffffffc,%edx
  101d36:	89 d0                	mov    %edx,%eax
  101d38:	c1 e8 02             	shr    $0x2,%eax
  101d3b:	89 de                	mov    %ebx,%esi
  101d3d:	89 c1                	mov    %eax,%ecx
  101d3f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
            switchk2u.tf_cs = USER_CS;
  101d41:	66 c7 05 3c fa 10 00 	movw   $0x1b,0x10fa3c
  101d48:	1b 00 
            switchk2u.tf_ds = switchk2u.tf_es = switchk2u.tf_ss = USER_DS;
  101d4a:	66 c7 05 48 fa 10 00 	movw   $0x23,0x10fa48
  101d51:	23 00 
  101d53:	0f b7 05 48 fa 10 00 	movzwl 0x10fa48,%eax
  101d5a:	66 a3 28 fa 10 00    	mov    %ax,0x10fa28
  101d60:	0f b7 05 28 fa 10 00 	movzwl 0x10fa28,%eax
  101d67:	66 a3 2c fa 10 00    	mov    %ax,0x10fa2c
            switchk2u.tf_esp = (uint32_t)tf + sizeof(struct trapframe) - 8;
  101d6d:	8b 45 08             	mov    0x8(%ebp),%eax
  101d70:	83 c0 44             	add    $0x44,%eax
  101d73:	a3 44 fa 10 00       	mov    %eax,0x10fa44
		
            // set eflags, make sure ucore can use io under user mode.
            // if CPL > IOPL, then cpu will generate a general protection.
            switchk2u.tf_eflags |= FL_IOPL_MASK;
  101d78:	a1 40 fa 10 00       	mov    0x10fa40,%eax
  101d7d:	80 cc 30             	or     $0x30,%ah
  101d80:	a3 40 fa 10 00       	mov    %eax,0x10fa40
		
            // set temporary stack
            // then iret will jump to the right stack
            *((uint32_t *)tf - 1) = (uint32_t)&switchk2u;
  101d85:	8b 45 08             	mov    0x8(%ebp),%eax
  101d88:	83 e8 04             	sub    $0x4,%eax
  101d8b:	ba 00 fa 10 00       	mov    $0x10fa00,%edx
  101d90:	89 10                	mov    %edx,(%eax)
        }
        break;
  101d92:	e9 b0 00 00 00       	jmp    101e47 <trap_dispatch+0x221>
  101d97:	e9 ab 00 00 00       	jmp    101e47 <trap_dispatch+0x221>
    case T_SWITCH_TOK:
        if (tf->tf_cs != KERNEL_CS) {
  101d9c:	8b 45 08             	mov    0x8(%ebp),%eax
  101d9f:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101da3:	66 83 f8 08          	cmp    $0x8,%ax
  101da7:	74 65                	je     101e0e <trap_dispatch+0x1e8>
            tf->tf_cs = KERNEL_CS;
  101da9:	8b 45 08             	mov    0x8(%ebp),%eax
  101dac:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
            tf->tf_ds = tf->tf_es = KERNEL_DS;
  101db2:	8b 45 08             	mov    0x8(%ebp),%eax
  101db5:	66 c7 40 28 10 00    	movw   $0x10,0x28(%eax)
  101dbb:	8b 45 08             	mov    0x8(%ebp),%eax
  101dbe:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101dc2:	8b 45 08             	mov    0x8(%ebp),%eax
  101dc5:	66 89 50 2c          	mov    %dx,0x2c(%eax)
            tf->tf_eflags &= ~FL_IOPL_MASK;
  101dc9:	8b 45 08             	mov    0x8(%ebp),%eax
  101dcc:	8b 40 40             	mov    0x40(%eax),%eax
  101dcf:	80 e4 cf             	and    $0xcf,%ah
  101dd2:	89 c2                	mov    %eax,%edx
  101dd4:	8b 45 08             	mov    0x8(%ebp),%eax
  101dd7:	89 50 40             	mov    %edx,0x40(%eax)
            switchu2k = (struct trapframe *)(tf->tf_esp - (sizeof(struct trapframe) - 8));
  101dda:	8b 45 08             	mov    0x8(%ebp),%eax
  101ddd:	8b 40 44             	mov    0x44(%eax),%eax
  101de0:	83 e8 44             	sub    $0x44,%eax
  101de3:	a3 4c fa 10 00       	mov    %eax,0x10fa4c
            memmove(switchu2k, tf, sizeof(struct trapframe) - 8);
  101de8:	a1 4c fa 10 00       	mov    0x10fa4c,%eax
  101ded:	83 ec 04             	sub    $0x4,%esp
  101df0:	6a 44                	push   $0x44
  101df2:	ff 75 08             	pushl  0x8(%ebp)
  101df5:	50                   	push   %eax
  101df6:	e8 ad 0f 00 00       	call   102da8 <memmove>
  101dfb:	83 c4 10             	add    $0x10,%esp
            *((uint32_t *)tf - 1) = (uint32_t)switchu2k;
  101dfe:	8b 45 08             	mov    0x8(%ebp),%eax
  101e01:	83 e8 04             	sub    $0x4,%eax
  101e04:	8b 15 4c fa 10 00    	mov    0x10fa4c,%edx
  101e0a:	89 10                	mov    %edx,(%eax)
        }
        break;
  101e0c:	eb 39                	jmp    101e47 <trap_dispatch+0x221>
  101e0e:	eb 37                	jmp    101e47 <trap_dispatch+0x221>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101e10:	8b 45 08             	mov    0x8(%ebp),%eax
  101e13:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e17:	0f b7 c0             	movzwl %ax,%eax
  101e1a:	83 e0 03             	and    $0x3,%eax
  101e1d:	85 c0                	test   %eax,%eax
  101e1f:	75 26                	jne    101e47 <trap_dispatch+0x221>
            print_trapframe(tf);
  101e21:	83 ec 0c             	sub    $0xc,%esp
  101e24:	ff 75 08             	pushl  0x8(%ebp)
  101e27:	e8 5f fb ff ff       	call   10198b <print_trapframe>
  101e2c:	83 c4 10             	add    $0x10,%esp
            panic("unexpected trap in kernel.\n");
  101e2f:	83 ec 04             	sub    $0x4,%esp
  101e32:	68 55 3a 10 00       	push   $0x103a55
  101e37:	68 d2 00 00 00       	push   $0xd2
  101e3c:	68 71 3a 10 00       	push   $0x103a71
  101e41:	e8 63 e5 ff ff       	call   1003a9 <__panic>
        break;
  101e46:	90                   	nop
        }
    }
}
  101e47:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101e4a:	5b                   	pop    %ebx
  101e4b:	5e                   	pop    %esi
  101e4c:	5f                   	pop    %edi
  101e4d:	5d                   	pop    %ebp
  101e4e:	c3                   	ret    

00101e4f <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101e4f:	55                   	push   %ebp
  101e50:	89 e5                	mov    %esp,%ebp
  101e52:	83 ec 08             	sub    $0x8,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101e55:	83 ec 0c             	sub    $0xc,%esp
  101e58:	ff 75 08             	pushl  0x8(%ebp)
  101e5b:	e8 c6 fd ff ff       	call   101c26 <trap_dispatch>
  101e60:	83 c4 10             	add    $0x10,%esp
}
  101e63:	c9                   	leave  
  101e64:	c3                   	ret    

00101e65 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101e65:	6a 00                	push   $0x0
  pushl $0
  101e67:	6a 00                	push   $0x0
  jmp __alltraps
  101e69:	e9 67 0a 00 00       	jmp    1028d5 <__alltraps>

00101e6e <vector1>:
.globl vector1
vector1:
  pushl $0
  101e6e:	6a 00                	push   $0x0
  pushl $1
  101e70:	6a 01                	push   $0x1
  jmp __alltraps
  101e72:	e9 5e 0a 00 00       	jmp    1028d5 <__alltraps>

00101e77 <vector2>:
.globl vector2
vector2:
  pushl $0
  101e77:	6a 00                	push   $0x0
  pushl $2
  101e79:	6a 02                	push   $0x2
  jmp __alltraps
  101e7b:	e9 55 0a 00 00       	jmp    1028d5 <__alltraps>

00101e80 <vector3>:
.globl vector3
vector3:
  pushl $0
  101e80:	6a 00                	push   $0x0
  pushl $3
  101e82:	6a 03                	push   $0x3
  jmp __alltraps
  101e84:	e9 4c 0a 00 00       	jmp    1028d5 <__alltraps>

00101e89 <vector4>:
.globl vector4
vector4:
  pushl $0
  101e89:	6a 00                	push   $0x0
  pushl $4
  101e8b:	6a 04                	push   $0x4
  jmp __alltraps
  101e8d:	e9 43 0a 00 00       	jmp    1028d5 <__alltraps>

00101e92 <vector5>:
.globl vector5
vector5:
  pushl $0
  101e92:	6a 00                	push   $0x0
  pushl $5
  101e94:	6a 05                	push   $0x5
  jmp __alltraps
  101e96:	e9 3a 0a 00 00       	jmp    1028d5 <__alltraps>

00101e9b <vector6>:
.globl vector6
vector6:
  pushl $0
  101e9b:	6a 00                	push   $0x0
  pushl $6
  101e9d:	6a 06                	push   $0x6
  jmp __alltraps
  101e9f:	e9 31 0a 00 00       	jmp    1028d5 <__alltraps>

00101ea4 <vector7>:
.globl vector7
vector7:
  pushl $0
  101ea4:	6a 00                	push   $0x0
  pushl $7
  101ea6:	6a 07                	push   $0x7
  jmp __alltraps
  101ea8:	e9 28 0a 00 00       	jmp    1028d5 <__alltraps>

00101ead <vector8>:
.globl vector8
vector8:
  pushl $8
  101ead:	6a 08                	push   $0x8
  jmp __alltraps
  101eaf:	e9 21 0a 00 00       	jmp    1028d5 <__alltraps>

00101eb4 <vector9>:
.globl vector9
vector9:
  pushl $9
  101eb4:	6a 09                	push   $0x9
  jmp __alltraps
  101eb6:	e9 1a 0a 00 00       	jmp    1028d5 <__alltraps>

00101ebb <vector10>:
.globl vector10
vector10:
  pushl $10
  101ebb:	6a 0a                	push   $0xa
  jmp __alltraps
  101ebd:	e9 13 0a 00 00       	jmp    1028d5 <__alltraps>

00101ec2 <vector11>:
.globl vector11
vector11:
  pushl $11
  101ec2:	6a 0b                	push   $0xb
  jmp __alltraps
  101ec4:	e9 0c 0a 00 00       	jmp    1028d5 <__alltraps>

00101ec9 <vector12>:
.globl vector12
vector12:
  pushl $12
  101ec9:	6a 0c                	push   $0xc
  jmp __alltraps
  101ecb:	e9 05 0a 00 00       	jmp    1028d5 <__alltraps>

00101ed0 <vector13>:
.globl vector13
vector13:
  pushl $13
  101ed0:	6a 0d                	push   $0xd
  jmp __alltraps
  101ed2:	e9 fe 09 00 00       	jmp    1028d5 <__alltraps>

00101ed7 <vector14>:
.globl vector14
vector14:
  pushl $14
  101ed7:	6a 0e                	push   $0xe
  jmp __alltraps
  101ed9:	e9 f7 09 00 00       	jmp    1028d5 <__alltraps>

00101ede <vector15>:
.globl vector15
vector15:
  pushl $0
  101ede:	6a 00                	push   $0x0
  pushl $15
  101ee0:	6a 0f                	push   $0xf
  jmp __alltraps
  101ee2:	e9 ee 09 00 00       	jmp    1028d5 <__alltraps>

00101ee7 <vector16>:
.globl vector16
vector16:
  pushl $0
  101ee7:	6a 00                	push   $0x0
  pushl $16
  101ee9:	6a 10                	push   $0x10
  jmp __alltraps
  101eeb:	e9 e5 09 00 00       	jmp    1028d5 <__alltraps>

00101ef0 <vector17>:
.globl vector17
vector17:
  pushl $17
  101ef0:	6a 11                	push   $0x11
  jmp __alltraps
  101ef2:	e9 de 09 00 00       	jmp    1028d5 <__alltraps>

00101ef7 <vector18>:
.globl vector18
vector18:
  pushl $0
  101ef7:	6a 00                	push   $0x0
  pushl $18
  101ef9:	6a 12                	push   $0x12
  jmp __alltraps
  101efb:	e9 d5 09 00 00       	jmp    1028d5 <__alltraps>

00101f00 <vector19>:
.globl vector19
vector19:
  pushl $0
  101f00:	6a 00                	push   $0x0
  pushl $19
  101f02:	6a 13                	push   $0x13
  jmp __alltraps
  101f04:	e9 cc 09 00 00       	jmp    1028d5 <__alltraps>

00101f09 <vector20>:
.globl vector20
vector20:
  pushl $0
  101f09:	6a 00                	push   $0x0
  pushl $20
  101f0b:	6a 14                	push   $0x14
  jmp __alltraps
  101f0d:	e9 c3 09 00 00       	jmp    1028d5 <__alltraps>

00101f12 <vector21>:
.globl vector21
vector21:
  pushl $0
  101f12:	6a 00                	push   $0x0
  pushl $21
  101f14:	6a 15                	push   $0x15
  jmp __alltraps
  101f16:	e9 ba 09 00 00       	jmp    1028d5 <__alltraps>

00101f1b <vector22>:
.globl vector22
vector22:
  pushl $0
  101f1b:	6a 00                	push   $0x0
  pushl $22
  101f1d:	6a 16                	push   $0x16
  jmp __alltraps
  101f1f:	e9 b1 09 00 00       	jmp    1028d5 <__alltraps>

00101f24 <vector23>:
.globl vector23
vector23:
  pushl $0
  101f24:	6a 00                	push   $0x0
  pushl $23
  101f26:	6a 17                	push   $0x17
  jmp __alltraps
  101f28:	e9 a8 09 00 00       	jmp    1028d5 <__alltraps>

00101f2d <vector24>:
.globl vector24
vector24:
  pushl $0
  101f2d:	6a 00                	push   $0x0
  pushl $24
  101f2f:	6a 18                	push   $0x18
  jmp __alltraps
  101f31:	e9 9f 09 00 00       	jmp    1028d5 <__alltraps>

00101f36 <vector25>:
.globl vector25
vector25:
  pushl $0
  101f36:	6a 00                	push   $0x0
  pushl $25
  101f38:	6a 19                	push   $0x19
  jmp __alltraps
  101f3a:	e9 96 09 00 00       	jmp    1028d5 <__alltraps>

00101f3f <vector26>:
.globl vector26
vector26:
  pushl $0
  101f3f:	6a 00                	push   $0x0
  pushl $26
  101f41:	6a 1a                	push   $0x1a
  jmp __alltraps
  101f43:	e9 8d 09 00 00       	jmp    1028d5 <__alltraps>

00101f48 <vector27>:
.globl vector27
vector27:
  pushl $0
  101f48:	6a 00                	push   $0x0
  pushl $27
  101f4a:	6a 1b                	push   $0x1b
  jmp __alltraps
  101f4c:	e9 84 09 00 00       	jmp    1028d5 <__alltraps>

00101f51 <vector28>:
.globl vector28
vector28:
  pushl $0
  101f51:	6a 00                	push   $0x0
  pushl $28
  101f53:	6a 1c                	push   $0x1c
  jmp __alltraps
  101f55:	e9 7b 09 00 00       	jmp    1028d5 <__alltraps>

00101f5a <vector29>:
.globl vector29
vector29:
  pushl $0
  101f5a:	6a 00                	push   $0x0
  pushl $29
  101f5c:	6a 1d                	push   $0x1d
  jmp __alltraps
  101f5e:	e9 72 09 00 00       	jmp    1028d5 <__alltraps>

00101f63 <vector30>:
.globl vector30
vector30:
  pushl $0
  101f63:	6a 00                	push   $0x0
  pushl $30
  101f65:	6a 1e                	push   $0x1e
  jmp __alltraps
  101f67:	e9 69 09 00 00       	jmp    1028d5 <__alltraps>

00101f6c <vector31>:
.globl vector31
vector31:
  pushl $0
  101f6c:	6a 00                	push   $0x0
  pushl $31
  101f6e:	6a 1f                	push   $0x1f
  jmp __alltraps
  101f70:	e9 60 09 00 00       	jmp    1028d5 <__alltraps>

00101f75 <vector32>:
.globl vector32
vector32:
  pushl $0
  101f75:	6a 00                	push   $0x0
  pushl $32
  101f77:	6a 20                	push   $0x20
  jmp __alltraps
  101f79:	e9 57 09 00 00       	jmp    1028d5 <__alltraps>

00101f7e <vector33>:
.globl vector33
vector33:
  pushl $0
  101f7e:	6a 00                	push   $0x0
  pushl $33
  101f80:	6a 21                	push   $0x21
  jmp __alltraps
  101f82:	e9 4e 09 00 00       	jmp    1028d5 <__alltraps>

00101f87 <vector34>:
.globl vector34
vector34:
  pushl $0
  101f87:	6a 00                	push   $0x0
  pushl $34
  101f89:	6a 22                	push   $0x22
  jmp __alltraps
  101f8b:	e9 45 09 00 00       	jmp    1028d5 <__alltraps>

00101f90 <vector35>:
.globl vector35
vector35:
  pushl $0
  101f90:	6a 00                	push   $0x0
  pushl $35
  101f92:	6a 23                	push   $0x23
  jmp __alltraps
  101f94:	e9 3c 09 00 00       	jmp    1028d5 <__alltraps>

00101f99 <vector36>:
.globl vector36
vector36:
  pushl $0
  101f99:	6a 00                	push   $0x0
  pushl $36
  101f9b:	6a 24                	push   $0x24
  jmp __alltraps
  101f9d:	e9 33 09 00 00       	jmp    1028d5 <__alltraps>

00101fa2 <vector37>:
.globl vector37
vector37:
  pushl $0
  101fa2:	6a 00                	push   $0x0
  pushl $37
  101fa4:	6a 25                	push   $0x25
  jmp __alltraps
  101fa6:	e9 2a 09 00 00       	jmp    1028d5 <__alltraps>

00101fab <vector38>:
.globl vector38
vector38:
  pushl $0
  101fab:	6a 00                	push   $0x0
  pushl $38
  101fad:	6a 26                	push   $0x26
  jmp __alltraps
  101faf:	e9 21 09 00 00       	jmp    1028d5 <__alltraps>

00101fb4 <vector39>:
.globl vector39
vector39:
  pushl $0
  101fb4:	6a 00                	push   $0x0
  pushl $39
  101fb6:	6a 27                	push   $0x27
  jmp __alltraps
  101fb8:	e9 18 09 00 00       	jmp    1028d5 <__alltraps>

00101fbd <vector40>:
.globl vector40
vector40:
  pushl $0
  101fbd:	6a 00                	push   $0x0
  pushl $40
  101fbf:	6a 28                	push   $0x28
  jmp __alltraps
  101fc1:	e9 0f 09 00 00       	jmp    1028d5 <__alltraps>

00101fc6 <vector41>:
.globl vector41
vector41:
  pushl $0
  101fc6:	6a 00                	push   $0x0
  pushl $41
  101fc8:	6a 29                	push   $0x29
  jmp __alltraps
  101fca:	e9 06 09 00 00       	jmp    1028d5 <__alltraps>

00101fcf <vector42>:
.globl vector42
vector42:
  pushl $0
  101fcf:	6a 00                	push   $0x0
  pushl $42
  101fd1:	6a 2a                	push   $0x2a
  jmp __alltraps
  101fd3:	e9 fd 08 00 00       	jmp    1028d5 <__alltraps>

00101fd8 <vector43>:
.globl vector43
vector43:
  pushl $0
  101fd8:	6a 00                	push   $0x0
  pushl $43
  101fda:	6a 2b                	push   $0x2b
  jmp __alltraps
  101fdc:	e9 f4 08 00 00       	jmp    1028d5 <__alltraps>

00101fe1 <vector44>:
.globl vector44
vector44:
  pushl $0
  101fe1:	6a 00                	push   $0x0
  pushl $44
  101fe3:	6a 2c                	push   $0x2c
  jmp __alltraps
  101fe5:	e9 eb 08 00 00       	jmp    1028d5 <__alltraps>

00101fea <vector45>:
.globl vector45
vector45:
  pushl $0
  101fea:	6a 00                	push   $0x0
  pushl $45
  101fec:	6a 2d                	push   $0x2d
  jmp __alltraps
  101fee:	e9 e2 08 00 00       	jmp    1028d5 <__alltraps>

00101ff3 <vector46>:
.globl vector46
vector46:
  pushl $0
  101ff3:	6a 00                	push   $0x0
  pushl $46
  101ff5:	6a 2e                	push   $0x2e
  jmp __alltraps
  101ff7:	e9 d9 08 00 00       	jmp    1028d5 <__alltraps>

00101ffc <vector47>:
.globl vector47
vector47:
  pushl $0
  101ffc:	6a 00                	push   $0x0
  pushl $47
  101ffe:	6a 2f                	push   $0x2f
  jmp __alltraps
  102000:	e9 d0 08 00 00       	jmp    1028d5 <__alltraps>

00102005 <vector48>:
.globl vector48
vector48:
  pushl $0
  102005:	6a 00                	push   $0x0
  pushl $48
  102007:	6a 30                	push   $0x30
  jmp __alltraps
  102009:	e9 c7 08 00 00       	jmp    1028d5 <__alltraps>

0010200e <vector49>:
.globl vector49
vector49:
  pushl $0
  10200e:	6a 00                	push   $0x0
  pushl $49
  102010:	6a 31                	push   $0x31
  jmp __alltraps
  102012:	e9 be 08 00 00       	jmp    1028d5 <__alltraps>

00102017 <vector50>:
.globl vector50
vector50:
  pushl $0
  102017:	6a 00                	push   $0x0
  pushl $50
  102019:	6a 32                	push   $0x32
  jmp __alltraps
  10201b:	e9 b5 08 00 00       	jmp    1028d5 <__alltraps>

00102020 <vector51>:
.globl vector51
vector51:
  pushl $0
  102020:	6a 00                	push   $0x0
  pushl $51
  102022:	6a 33                	push   $0x33
  jmp __alltraps
  102024:	e9 ac 08 00 00       	jmp    1028d5 <__alltraps>

00102029 <vector52>:
.globl vector52
vector52:
  pushl $0
  102029:	6a 00                	push   $0x0
  pushl $52
  10202b:	6a 34                	push   $0x34
  jmp __alltraps
  10202d:	e9 a3 08 00 00       	jmp    1028d5 <__alltraps>

00102032 <vector53>:
.globl vector53
vector53:
  pushl $0
  102032:	6a 00                	push   $0x0
  pushl $53
  102034:	6a 35                	push   $0x35
  jmp __alltraps
  102036:	e9 9a 08 00 00       	jmp    1028d5 <__alltraps>

0010203b <vector54>:
.globl vector54
vector54:
  pushl $0
  10203b:	6a 00                	push   $0x0
  pushl $54
  10203d:	6a 36                	push   $0x36
  jmp __alltraps
  10203f:	e9 91 08 00 00       	jmp    1028d5 <__alltraps>

00102044 <vector55>:
.globl vector55
vector55:
  pushl $0
  102044:	6a 00                	push   $0x0
  pushl $55
  102046:	6a 37                	push   $0x37
  jmp __alltraps
  102048:	e9 88 08 00 00       	jmp    1028d5 <__alltraps>

0010204d <vector56>:
.globl vector56
vector56:
  pushl $0
  10204d:	6a 00                	push   $0x0
  pushl $56
  10204f:	6a 38                	push   $0x38
  jmp __alltraps
  102051:	e9 7f 08 00 00       	jmp    1028d5 <__alltraps>

00102056 <vector57>:
.globl vector57
vector57:
  pushl $0
  102056:	6a 00                	push   $0x0
  pushl $57
  102058:	6a 39                	push   $0x39
  jmp __alltraps
  10205a:	e9 76 08 00 00       	jmp    1028d5 <__alltraps>

0010205f <vector58>:
.globl vector58
vector58:
  pushl $0
  10205f:	6a 00                	push   $0x0
  pushl $58
  102061:	6a 3a                	push   $0x3a
  jmp __alltraps
  102063:	e9 6d 08 00 00       	jmp    1028d5 <__alltraps>

00102068 <vector59>:
.globl vector59
vector59:
  pushl $0
  102068:	6a 00                	push   $0x0
  pushl $59
  10206a:	6a 3b                	push   $0x3b
  jmp __alltraps
  10206c:	e9 64 08 00 00       	jmp    1028d5 <__alltraps>

00102071 <vector60>:
.globl vector60
vector60:
  pushl $0
  102071:	6a 00                	push   $0x0
  pushl $60
  102073:	6a 3c                	push   $0x3c
  jmp __alltraps
  102075:	e9 5b 08 00 00       	jmp    1028d5 <__alltraps>

0010207a <vector61>:
.globl vector61
vector61:
  pushl $0
  10207a:	6a 00                	push   $0x0
  pushl $61
  10207c:	6a 3d                	push   $0x3d
  jmp __alltraps
  10207e:	e9 52 08 00 00       	jmp    1028d5 <__alltraps>

00102083 <vector62>:
.globl vector62
vector62:
  pushl $0
  102083:	6a 00                	push   $0x0
  pushl $62
  102085:	6a 3e                	push   $0x3e
  jmp __alltraps
  102087:	e9 49 08 00 00       	jmp    1028d5 <__alltraps>

0010208c <vector63>:
.globl vector63
vector63:
  pushl $0
  10208c:	6a 00                	push   $0x0
  pushl $63
  10208e:	6a 3f                	push   $0x3f
  jmp __alltraps
  102090:	e9 40 08 00 00       	jmp    1028d5 <__alltraps>

00102095 <vector64>:
.globl vector64
vector64:
  pushl $0
  102095:	6a 00                	push   $0x0
  pushl $64
  102097:	6a 40                	push   $0x40
  jmp __alltraps
  102099:	e9 37 08 00 00       	jmp    1028d5 <__alltraps>

0010209e <vector65>:
.globl vector65
vector65:
  pushl $0
  10209e:	6a 00                	push   $0x0
  pushl $65
  1020a0:	6a 41                	push   $0x41
  jmp __alltraps
  1020a2:	e9 2e 08 00 00       	jmp    1028d5 <__alltraps>

001020a7 <vector66>:
.globl vector66
vector66:
  pushl $0
  1020a7:	6a 00                	push   $0x0
  pushl $66
  1020a9:	6a 42                	push   $0x42
  jmp __alltraps
  1020ab:	e9 25 08 00 00       	jmp    1028d5 <__alltraps>

001020b0 <vector67>:
.globl vector67
vector67:
  pushl $0
  1020b0:	6a 00                	push   $0x0
  pushl $67
  1020b2:	6a 43                	push   $0x43
  jmp __alltraps
  1020b4:	e9 1c 08 00 00       	jmp    1028d5 <__alltraps>

001020b9 <vector68>:
.globl vector68
vector68:
  pushl $0
  1020b9:	6a 00                	push   $0x0
  pushl $68
  1020bb:	6a 44                	push   $0x44
  jmp __alltraps
  1020bd:	e9 13 08 00 00       	jmp    1028d5 <__alltraps>

001020c2 <vector69>:
.globl vector69
vector69:
  pushl $0
  1020c2:	6a 00                	push   $0x0
  pushl $69
  1020c4:	6a 45                	push   $0x45
  jmp __alltraps
  1020c6:	e9 0a 08 00 00       	jmp    1028d5 <__alltraps>

001020cb <vector70>:
.globl vector70
vector70:
  pushl $0
  1020cb:	6a 00                	push   $0x0
  pushl $70
  1020cd:	6a 46                	push   $0x46
  jmp __alltraps
  1020cf:	e9 01 08 00 00       	jmp    1028d5 <__alltraps>

001020d4 <vector71>:
.globl vector71
vector71:
  pushl $0
  1020d4:	6a 00                	push   $0x0
  pushl $71
  1020d6:	6a 47                	push   $0x47
  jmp __alltraps
  1020d8:	e9 f8 07 00 00       	jmp    1028d5 <__alltraps>

001020dd <vector72>:
.globl vector72
vector72:
  pushl $0
  1020dd:	6a 00                	push   $0x0
  pushl $72
  1020df:	6a 48                	push   $0x48
  jmp __alltraps
  1020e1:	e9 ef 07 00 00       	jmp    1028d5 <__alltraps>

001020e6 <vector73>:
.globl vector73
vector73:
  pushl $0
  1020e6:	6a 00                	push   $0x0
  pushl $73
  1020e8:	6a 49                	push   $0x49
  jmp __alltraps
  1020ea:	e9 e6 07 00 00       	jmp    1028d5 <__alltraps>

001020ef <vector74>:
.globl vector74
vector74:
  pushl $0
  1020ef:	6a 00                	push   $0x0
  pushl $74
  1020f1:	6a 4a                	push   $0x4a
  jmp __alltraps
  1020f3:	e9 dd 07 00 00       	jmp    1028d5 <__alltraps>

001020f8 <vector75>:
.globl vector75
vector75:
  pushl $0
  1020f8:	6a 00                	push   $0x0
  pushl $75
  1020fa:	6a 4b                	push   $0x4b
  jmp __alltraps
  1020fc:	e9 d4 07 00 00       	jmp    1028d5 <__alltraps>

00102101 <vector76>:
.globl vector76
vector76:
  pushl $0
  102101:	6a 00                	push   $0x0
  pushl $76
  102103:	6a 4c                	push   $0x4c
  jmp __alltraps
  102105:	e9 cb 07 00 00       	jmp    1028d5 <__alltraps>

0010210a <vector77>:
.globl vector77
vector77:
  pushl $0
  10210a:	6a 00                	push   $0x0
  pushl $77
  10210c:	6a 4d                	push   $0x4d
  jmp __alltraps
  10210e:	e9 c2 07 00 00       	jmp    1028d5 <__alltraps>

00102113 <vector78>:
.globl vector78
vector78:
  pushl $0
  102113:	6a 00                	push   $0x0
  pushl $78
  102115:	6a 4e                	push   $0x4e
  jmp __alltraps
  102117:	e9 b9 07 00 00       	jmp    1028d5 <__alltraps>

0010211c <vector79>:
.globl vector79
vector79:
  pushl $0
  10211c:	6a 00                	push   $0x0
  pushl $79
  10211e:	6a 4f                	push   $0x4f
  jmp __alltraps
  102120:	e9 b0 07 00 00       	jmp    1028d5 <__alltraps>

00102125 <vector80>:
.globl vector80
vector80:
  pushl $0
  102125:	6a 00                	push   $0x0
  pushl $80
  102127:	6a 50                	push   $0x50
  jmp __alltraps
  102129:	e9 a7 07 00 00       	jmp    1028d5 <__alltraps>

0010212e <vector81>:
.globl vector81
vector81:
  pushl $0
  10212e:	6a 00                	push   $0x0
  pushl $81
  102130:	6a 51                	push   $0x51
  jmp __alltraps
  102132:	e9 9e 07 00 00       	jmp    1028d5 <__alltraps>

00102137 <vector82>:
.globl vector82
vector82:
  pushl $0
  102137:	6a 00                	push   $0x0
  pushl $82
  102139:	6a 52                	push   $0x52
  jmp __alltraps
  10213b:	e9 95 07 00 00       	jmp    1028d5 <__alltraps>

00102140 <vector83>:
.globl vector83
vector83:
  pushl $0
  102140:	6a 00                	push   $0x0
  pushl $83
  102142:	6a 53                	push   $0x53
  jmp __alltraps
  102144:	e9 8c 07 00 00       	jmp    1028d5 <__alltraps>

00102149 <vector84>:
.globl vector84
vector84:
  pushl $0
  102149:	6a 00                	push   $0x0
  pushl $84
  10214b:	6a 54                	push   $0x54
  jmp __alltraps
  10214d:	e9 83 07 00 00       	jmp    1028d5 <__alltraps>

00102152 <vector85>:
.globl vector85
vector85:
  pushl $0
  102152:	6a 00                	push   $0x0
  pushl $85
  102154:	6a 55                	push   $0x55
  jmp __alltraps
  102156:	e9 7a 07 00 00       	jmp    1028d5 <__alltraps>

0010215b <vector86>:
.globl vector86
vector86:
  pushl $0
  10215b:	6a 00                	push   $0x0
  pushl $86
  10215d:	6a 56                	push   $0x56
  jmp __alltraps
  10215f:	e9 71 07 00 00       	jmp    1028d5 <__alltraps>

00102164 <vector87>:
.globl vector87
vector87:
  pushl $0
  102164:	6a 00                	push   $0x0
  pushl $87
  102166:	6a 57                	push   $0x57
  jmp __alltraps
  102168:	e9 68 07 00 00       	jmp    1028d5 <__alltraps>

0010216d <vector88>:
.globl vector88
vector88:
  pushl $0
  10216d:	6a 00                	push   $0x0
  pushl $88
  10216f:	6a 58                	push   $0x58
  jmp __alltraps
  102171:	e9 5f 07 00 00       	jmp    1028d5 <__alltraps>

00102176 <vector89>:
.globl vector89
vector89:
  pushl $0
  102176:	6a 00                	push   $0x0
  pushl $89
  102178:	6a 59                	push   $0x59
  jmp __alltraps
  10217a:	e9 56 07 00 00       	jmp    1028d5 <__alltraps>

0010217f <vector90>:
.globl vector90
vector90:
  pushl $0
  10217f:	6a 00                	push   $0x0
  pushl $90
  102181:	6a 5a                	push   $0x5a
  jmp __alltraps
  102183:	e9 4d 07 00 00       	jmp    1028d5 <__alltraps>

00102188 <vector91>:
.globl vector91
vector91:
  pushl $0
  102188:	6a 00                	push   $0x0
  pushl $91
  10218a:	6a 5b                	push   $0x5b
  jmp __alltraps
  10218c:	e9 44 07 00 00       	jmp    1028d5 <__alltraps>

00102191 <vector92>:
.globl vector92
vector92:
  pushl $0
  102191:	6a 00                	push   $0x0
  pushl $92
  102193:	6a 5c                	push   $0x5c
  jmp __alltraps
  102195:	e9 3b 07 00 00       	jmp    1028d5 <__alltraps>

0010219a <vector93>:
.globl vector93
vector93:
  pushl $0
  10219a:	6a 00                	push   $0x0
  pushl $93
  10219c:	6a 5d                	push   $0x5d
  jmp __alltraps
  10219e:	e9 32 07 00 00       	jmp    1028d5 <__alltraps>

001021a3 <vector94>:
.globl vector94
vector94:
  pushl $0
  1021a3:	6a 00                	push   $0x0
  pushl $94
  1021a5:	6a 5e                	push   $0x5e
  jmp __alltraps
  1021a7:	e9 29 07 00 00       	jmp    1028d5 <__alltraps>

001021ac <vector95>:
.globl vector95
vector95:
  pushl $0
  1021ac:	6a 00                	push   $0x0
  pushl $95
  1021ae:	6a 5f                	push   $0x5f
  jmp __alltraps
  1021b0:	e9 20 07 00 00       	jmp    1028d5 <__alltraps>

001021b5 <vector96>:
.globl vector96
vector96:
  pushl $0
  1021b5:	6a 00                	push   $0x0
  pushl $96
  1021b7:	6a 60                	push   $0x60
  jmp __alltraps
  1021b9:	e9 17 07 00 00       	jmp    1028d5 <__alltraps>

001021be <vector97>:
.globl vector97
vector97:
  pushl $0
  1021be:	6a 00                	push   $0x0
  pushl $97
  1021c0:	6a 61                	push   $0x61
  jmp __alltraps
  1021c2:	e9 0e 07 00 00       	jmp    1028d5 <__alltraps>

001021c7 <vector98>:
.globl vector98
vector98:
  pushl $0
  1021c7:	6a 00                	push   $0x0
  pushl $98
  1021c9:	6a 62                	push   $0x62
  jmp __alltraps
  1021cb:	e9 05 07 00 00       	jmp    1028d5 <__alltraps>

001021d0 <vector99>:
.globl vector99
vector99:
  pushl $0
  1021d0:	6a 00                	push   $0x0
  pushl $99
  1021d2:	6a 63                	push   $0x63
  jmp __alltraps
  1021d4:	e9 fc 06 00 00       	jmp    1028d5 <__alltraps>

001021d9 <vector100>:
.globl vector100
vector100:
  pushl $0
  1021d9:	6a 00                	push   $0x0
  pushl $100
  1021db:	6a 64                	push   $0x64
  jmp __alltraps
  1021dd:	e9 f3 06 00 00       	jmp    1028d5 <__alltraps>

001021e2 <vector101>:
.globl vector101
vector101:
  pushl $0
  1021e2:	6a 00                	push   $0x0
  pushl $101
  1021e4:	6a 65                	push   $0x65
  jmp __alltraps
  1021e6:	e9 ea 06 00 00       	jmp    1028d5 <__alltraps>

001021eb <vector102>:
.globl vector102
vector102:
  pushl $0
  1021eb:	6a 00                	push   $0x0
  pushl $102
  1021ed:	6a 66                	push   $0x66
  jmp __alltraps
  1021ef:	e9 e1 06 00 00       	jmp    1028d5 <__alltraps>

001021f4 <vector103>:
.globl vector103
vector103:
  pushl $0
  1021f4:	6a 00                	push   $0x0
  pushl $103
  1021f6:	6a 67                	push   $0x67
  jmp __alltraps
  1021f8:	e9 d8 06 00 00       	jmp    1028d5 <__alltraps>

001021fd <vector104>:
.globl vector104
vector104:
  pushl $0
  1021fd:	6a 00                	push   $0x0
  pushl $104
  1021ff:	6a 68                	push   $0x68
  jmp __alltraps
  102201:	e9 cf 06 00 00       	jmp    1028d5 <__alltraps>

00102206 <vector105>:
.globl vector105
vector105:
  pushl $0
  102206:	6a 00                	push   $0x0
  pushl $105
  102208:	6a 69                	push   $0x69
  jmp __alltraps
  10220a:	e9 c6 06 00 00       	jmp    1028d5 <__alltraps>

0010220f <vector106>:
.globl vector106
vector106:
  pushl $0
  10220f:	6a 00                	push   $0x0
  pushl $106
  102211:	6a 6a                	push   $0x6a
  jmp __alltraps
  102213:	e9 bd 06 00 00       	jmp    1028d5 <__alltraps>

00102218 <vector107>:
.globl vector107
vector107:
  pushl $0
  102218:	6a 00                	push   $0x0
  pushl $107
  10221a:	6a 6b                	push   $0x6b
  jmp __alltraps
  10221c:	e9 b4 06 00 00       	jmp    1028d5 <__alltraps>

00102221 <vector108>:
.globl vector108
vector108:
  pushl $0
  102221:	6a 00                	push   $0x0
  pushl $108
  102223:	6a 6c                	push   $0x6c
  jmp __alltraps
  102225:	e9 ab 06 00 00       	jmp    1028d5 <__alltraps>

0010222a <vector109>:
.globl vector109
vector109:
  pushl $0
  10222a:	6a 00                	push   $0x0
  pushl $109
  10222c:	6a 6d                	push   $0x6d
  jmp __alltraps
  10222e:	e9 a2 06 00 00       	jmp    1028d5 <__alltraps>

00102233 <vector110>:
.globl vector110
vector110:
  pushl $0
  102233:	6a 00                	push   $0x0
  pushl $110
  102235:	6a 6e                	push   $0x6e
  jmp __alltraps
  102237:	e9 99 06 00 00       	jmp    1028d5 <__alltraps>

0010223c <vector111>:
.globl vector111
vector111:
  pushl $0
  10223c:	6a 00                	push   $0x0
  pushl $111
  10223e:	6a 6f                	push   $0x6f
  jmp __alltraps
  102240:	e9 90 06 00 00       	jmp    1028d5 <__alltraps>

00102245 <vector112>:
.globl vector112
vector112:
  pushl $0
  102245:	6a 00                	push   $0x0
  pushl $112
  102247:	6a 70                	push   $0x70
  jmp __alltraps
  102249:	e9 87 06 00 00       	jmp    1028d5 <__alltraps>

0010224e <vector113>:
.globl vector113
vector113:
  pushl $0
  10224e:	6a 00                	push   $0x0
  pushl $113
  102250:	6a 71                	push   $0x71
  jmp __alltraps
  102252:	e9 7e 06 00 00       	jmp    1028d5 <__alltraps>

00102257 <vector114>:
.globl vector114
vector114:
  pushl $0
  102257:	6a 00                	push   $0x0
  pushl $114
  102259:	6a 72                	push   $0x72
  jmp __alltraps
  10225b:	e9 75 06 00 00       	jmp    1028d5 <__alltraps>

00102260 <vector115>:
.globl vector115
vector115:
  pushl $0
  102260:	6a 00                	push   $0x0
  pushl $115
  102262:	6a 73                	push   $0x73
  jmp __alltraps
  102264:	e9 6c 06 00 00       	jmp    1028d5 <__alltraps>

00102269 <vector116>:
.globl vector116
vector116:
  pushl $0
  102269:	6a 00                	push   $0x0
  pushl $116
  10226b:	6a 74                	push   $0x74
  jmp __alltraps
  10226d:	e9 63 06 00 00       	jmp    1028d5 <__alltraps>

00102272 <vector117>:
.globl vector117
vector117:
  pushl $0
  102272:	6a 00                	push   $0x0
  pushl $117
  102274:	6a 75                	push   $0x75
  jmp __alltraps
  102276:	e9 5a 06 00 00       	jmp    1028d5 <__alltraps>

0010227b <vector118>:
.globl vector118
vector118:
  pushl $0
  10227b:	6a 00                	push   $0x0
  pushl $118
  10227d:	6a 76                	push   $0x76
  jmp __alltraps
  10227f:	e9 51 06 00 00       	jmp    1028d5 <__alltraps>

00102284 <vector119>:
.globl vector119
vector119:
  pushl $0
  102284:	6a 00                	push   $0x0
  pushl $119
  102286:	6a 77                	push   $0x77
  jmp __alltraps
  102288:	e9 48 06 00 00       	jmp    1028d5 <__alltraps>

0010228d <vector120>:
.globl vector120
vector120:
  pushl $0
  10228d:	6a 00                	push   $0x0
  pushl $120
  10228f:	6a 78                	push   $0x78
  jmp __alltraps
  102291:	e9 3f 06 00 00       	jmp    1028d5 <__alltraps>

00102296 <vector121>:
.globl vector121
vector121:
  pushl $0
  102296:	6a 00                	push   $0x0
  pushl $121
  102298:	6a 79                	push   $0x79
  jmp __alltraps
  10229a:	e9 36 06 00 00       	jmp    1028d5 <__alltraps>

0010229f <vector122>:
.globl vector122
vector122:
  pushl $0
  10229f:	6a 00                	push   $0x0
  pushl $122
  1022a1:	6a 7a                	push   $0x7a
  jmp __alltraps
  1022a3:	e9 2d 06 00 00       	jmp    1028d5 <__alltraps>

001022a8 <vector123>:
.globl vector123
vector123:
  pushl $0
  1022a8:	6a 00                	push   $0x0
  pushl $123
  1022aa:	6a 7b                	push   $0x7b
  jmp __alltraps
  1022ac:	e9 24 06 00 00       	jmp    1028d5 <__alltraps>

001022b1 <vector124>:
.globl vector124
vector124:
  pushl $0
  1022b1:	6a 00                	push   $0x0
  pushl $124
  1022b3:	6a 7c                	push   $0x7c
  jmp __alltraps
  1022b5:	e9 1b 06 00 00       	jmp    1028d5 <__alltraps>

001022ba <vector125>:
.globl vector125
vector125:
  pushl $0
  1022ba:	6a 00                	push   $0x0
  pushl $125
  1022bc:	6a 7d                	push   $0x7d
  jmp __alltraps
  1022be:	e9 12 06 00 00       	jmp    1028d5 <__alltraps>

001022c3 <vector126>:
.globl vector126
vector126:
  pushl $0
  1022c3:	6a 00                	push   $0x0
  pushl $126
  1022c5:	6a 7e                	push   $0x7e
  jmp __alltraps
  1022c7:	e9 09 06 00 00       	jmp    1028d5 <__alltraps>

001022cc <vector127>:
.globl vector127
vector127:
  pushl $0
  1022cc:	6a 00                	push   $0x0
  pushl $127
  1022ce:	6a 7f                	push   $0x7f
  jmp __alltraps
  1022d0:	e9 00 06 00 00       	jmp    1028d5 <__alltraps>

001022d5 <vector128>:
.globl vector128
vector128:
  pushl $0
  1022d5:	6a 00                	push   $0x0
  pushl $128
  1022d7:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  1022dc:	e9 f4 05 00 00       	jmp    1028d5 <__alltraps>

001022e1 <vector129>:
.globl vector129
vector129:
  pushl $0
  1022e1:	6a 00                	push   $0x0
  pushl $129
  1022e3:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  1022e8:	e9 e8 05 00 00       	jmp    1028d5 <__alltraps>

001022ed <vector130>:
.globl vector130
vector130:
  pushl $0
  1022ed:	6a 00                	push   $0x0
  pushl $130
  1022ef:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  1022f4:	e9 dc 05 00 00       	jmp    1028d5 <__alltraps>

001022f9 <vector131>:
.globl vector131
vector131:
  pushl $0
  1022f9:	6a 00                	push   $0x0
  pushl $131
  1022fb:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102300:	e9 d0 05 00 00       	jmp    1028d5 <__alltraps>

00102305 <vector132>:
.globl vector132
vector132:
  pushl $0
  102305:	6a 00                	push   $0x0
  pushl $132
  102307:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  10230c:	e9 c4 05 00 00       	jmp    1028d5 <__alltraps>

00102311 <vector133>:
.globl vector133
vector133:
  pushl $0
  102311:	6a 00                	push   $0x0
  pushl $133
  102313:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  102318:	e9 b8 05 00 00       	jmp    1028d5 <__alltraps>

0010231d <vector134>:
.globl vector134
vector134:
  pushl $0
  10231d:	6a 00                	push   $0x0
  pushl $134
  10231f:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102324:	e9 ac 05 00 00       	jmp    1028d5 <__alltraps>

00102329 <vector135>:
.globl vector135
vector135:
  pushl $0
  102329:	6a 00                	push   $0x0
  pushl $135
  10232b:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  102330:	e9 a0 05 00 00       	jmp    1028d5 <__alltraps>

00102335 <vector136>:
.globl vector136
vector136:
  pushl $0
  102335:	6a 00                	push   $0x0
  pushl $136
  102337:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  10233c:	e9 94 05 00 00       	jmp    1028d5 <__alltraps>

00102341 <vector137>:
.globl vector137
vector137:
  pushl $0
  102341:	6a 00                	push   $0x0
  pushl $137
  102343:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  102348:	e9 88 05 00 00       	jmp    1028d5 <__alltraps>

0010234d <vector138>:
.globl vector138
vector138:
  pushl $0
  10234d:	6a 00                	push   $0x0
  pushl $138
  10234f:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  102354:	e9 7c 05 00 00       	jmp    1028d5 <__alltraps>

00102359 <vector139>:
.globl vector139
vector139:
  pushl $0
  102359:	6a 00                	push   $0x0
  pushl $139
  10235b:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  102360:	e9 70 05 00 00       	jmp    1028d5 <__alltraps>

00102365 <vector140>:
.globl vector140
vector140:
  pushl $0
  102365:	6a 00                	push   $0x0
  pushl $140
  102367:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  10236c:	e9 64 05 00 00       	jmp    1028d5 <__alltraps>

00102371 <vector141>:
.globl vector141
vector141:
  pushl $0
  102371:	6a 00                	push   $0x0
  pushl $141
  102373:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  102378:	e9 58 05 00 00       	jmp    1028d5 <__alltraps>

0010237d <vector142>:
.globl vector142
vector142:
  pushl $0
  10237d:	6a 00                	push   $0x0
  pushl $142
  10237f:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  102384:	e9 4c 05 00 00       	jmp    1028d5 <__alltraps>

00102389 <vector143>:
.globl vector143
vector143:
  pushl $0
  102389:	6a 00                	push   $0x0
  pushl $143
  10238b:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  102390:	e9 40 05 00 00       	jmp    1028d5 <__alltraps>

00102395 <vector144>:
.globl vector144
vector144:
  pushl $0
  102395:	6a 00                	push   $0x0
  pushl $144
  102397:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  10239c:	e9 34 05 00 00       	jmp    1028d5 <__alltraps>

001023a1 <vector145>:
.globl vector145
vector145:
  pushl $0
  1023a1:	6a 00                	push   $0x0
  pushl $145
  1023a3:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  1023a8:	e9 28 05 00 00       	jmp    1028d5 <__alltraps>

001023ad <vector146>:
.globl vector146
vector146:
  pushl $0
  1023ad:	6a 00                	push   $0x0
  pushl $146
  1023af:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  1023b4:	e9 1c 05 00 00       	jmp    1028d5 <__alltraps>

001023b9 <vector147>:
.globl vector147
vector147:
  pushl $0
  1023b9:	6a 00                	push   $0x0
  pushl $147
  1023bb:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  1023c0:	e9 10 05 00 00       	jmp    1028d5 <__alltraps>

001023c5 <vector148>:
.globl vector148
vector148:
  pushl $0
  1023c5:	6a 00                	push   $0x0
  pushl $148
  1023c7:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  1023cc:	e9 04 05 00 00       	jmp    1028d5 <__alltraps>

001023d1 <vector149>:
.globl vector149
vector149:
  pushl $0
  1023d1:	6a 00                	push   $0x0
  pushl $149
  1023d3:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  1023d8:	e9 f8 04 00 00       	jmp    1028d5 <__alltraps>

001023dd <vector150>:
.globl vector150
vector150:
  pushl $0
  1023dd:	6a 00                	push   $0x0
  pushl $150
  1023df:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  1023e4:	e9 ec 04 00 00       	jmp    1028d5 <__alltraps>

001023e9 <vector151>:
.globl vector151
vector151:
  pushl $0
  1023e9:	6a 00                	push   $0x0
  pushl $151
  1023eb:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  1023f0:	e9 e0 04 00 00       	jmp    1028d5 <__alltraps>

001023f5 <vector152>:
.globl vector152
vector152:
  pushl $0
  1023f5:	6a 00                	push   $0x0
  pushl $152
  1023f7:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  1023fc:	e9 d4 04 00 00       	jmp    1028d5 <__alltraps>

00102401 <vector153>:
.globl vector153
vector153:
  pushl $0
  102401:	6a 00                	push   $0x0
  pushl $153
  102403:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  102408:	e9 c8 04 00 00       	jmp    1028d5 <__alltraps>

0010240d <vector154>:
.globl vector154
vector154:
  pushl $0
  10240d:	6a 00                	push   $0x0
  pushl $154
  10240f:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102414:	e9 bc 04 00 00       	jmp    1028d5 <__alltraps>

00102419 <vector155>:
.globl vector155
vector155:
  pushl $0
  102419:	6a 00                	push   $0x0
  pushl $155
  10241b:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  102420:	e9 b0 04 00 00       	jmp    1028d5 <__alltraps>

00102425 <vector156>:
.globl vector156
vector156:
  pushl $0
  102425:	6a 00                	push   $0x0
  pushl $156
  102427:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  10242c:	e9 a4 04 00 00       	jmp    1028d5 <__alltraps>

00102431 <vector157>:
.globl vector157
vector157:
  pushl $0
  102431:	6a 00                	push   $0x0
  pushl $157
  102433:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  102438:	e9 98 04 00 00       	jmp    1028d5 <__alltraps>

0010243d <vector158>:
.globl vector158
vector158:
  pushl $0
  10243d:	6a 00                	push   $0x0
  pushl $158
  10243f:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  102444:	e9 8c 04 00 00       	jmp    1028d5 <__alltraps>

00102449 <vector159>:
.globl vector159
vector159:
  pushl $0
  102449:	6a 00                	push   $0x0
  pushl $159
  10244b:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  102450:	e9 80 04 00 00       	jmp    1028d5 <__alltraps>

00102455 <vector160>:
.globl vector160
vector160:
  pushl $0
  102455:	6a 00                	push   $0x0
  pushl $160
  102457:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  10245c:	e9 74 04 00 00       	jmp    1028d5 <__alltraps>

00102461 <vector161>:
.globl vector161
vector161:
  pushl $0
  102461:	6a 00                	push   $0x0
  pushl $161
  102463:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  102468:	e9 68 04 00 00       	jmp    1028d5 <__alltraps>

0010246d <vector162>:
.globl vector162
vector162:
  pushl $0
  10246d:	6a 00                	push   $0x0
  pushl $162
  10246f:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  102474:	e9 5c 04 00 00       	jmp    1028d5 <__alltraps>

00102479 <vector163>:
.globl vector163
vector163:
  pushl $0
  102479:	6a 00                	push   $0x0
  pushl $163
  10247b:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  102480:	e9 50 04 00 00       	jmp    1028d5 <__alltraps>

00102485 <vector164>:
.globl vector164
vector164:
  pushl $0
  102485:	6a 00                	push   $0x0
  pushl $164
  102487:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  10248c:	e9 44 04 00 00       	jmp    1028d5 <__alltraps>

00102491 <vector165>:
.globl vector165
vector165:
  pushl $0
  102491:	6a 00                	push   $0x0
  pushl $165
  102493:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  102498:	e9 38 04 00 00       	jmp    1028d5 <__alltraps>

0010249d <vector166>:
.globl vector166
vector166:
  pushl $0
  10249d:	6a 00                	push   $0x0
  pushl $166
  10249f:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  1024a4:	e9 2c 04 00 00       	jmp    1028d5 <__alltraps>

001024a9 <vector167>:
.globl vector167
vector167:
  pushl $0
  1024a9:	6a 00                	push   $0x0
  pushl $167
  1024ab:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  1024b0:	e9 20 04 00 00       	jmp    1028d5 <__alltraps>

001024b5 <vector168>:
.globl vector168
vector168:
  pushl $0
  1024b5:	6a 00                	push   $0x0
  pushl $168
  1024b7:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  1024bc:	e9 14 04 00 00       	jmp    1028d5 <__alltraps>

001024c1 <vector169>:
.globl vector169
vector169:
  pushl $0
  1024c1:	6a 00                	push   $0x0
  pushl $169
  1024c3:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  1024c8:	e9 08 04 00 00       	jmp    1028d5 <__alltraps>

001024cd <vector170>:
.globl vector170
vector170:
  pushl $0
  1024cd:	6a 00                	push   $0x0
  pushl $170
  1024cf:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  1024d4:	e9 fc 03 00 00       	jmp    1028d5 <__alltraps>

001024d9 <vector171>:
.globl vector171
vector171:
  pushl $0
  1024d9:	6a 00                	push   $0x0
  pushl $171
  1024db:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  1024e0:	e9 f0 03 00 00       	jmp    1028d5 <__alltraps>

001024e5 <vector172>:
.globl vector172
vector172:
  pushl $0
  1024e5:	6a 00                	push   $0x0
  pushl $172
  1024e7:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  1024ec:	e9 e4 03 00 00       	jmp    1028d5 <__alltraps>

001024f1 <vector173>:
.globl vector173
vector173:
  pushl $0
  1024f1:	6a 00                	push   $0x0
  pushl $173
  1024f3:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  1024f8:	e9 d8 03 00 00       	jmp    1028d5 <__alltraps>

001024fd <vector174>:
.globl vector174
vector174:
  pushl $0
  1024fd:	6a 00                	push   $0x0
  pushl $174
  1024ff:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102504:	e9 cc 03 00 00       	jmp    1028d5 <__alltraps>

00102509 <vector175>:
.globl vector175
vector175:
  pushl $0
  102509:	6a 00                	push   $0x0
  pushl $175
  10250b:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102510:	e9 c0 03 00 00       	jmp    1028d5 <__alltraps>

00102515 <vector176>:
.globl vector176
vector176:
  pushl $0
  102515:	6a 00                	push   $0x0
  pushl $176
  102517:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  10251c:	e9 b4 03 00 00       	jmp    1028d5 <__alltraps>

00102521 <vector177>:
.globl vector177
vector177:
  pushl $0
  102521:	6a 00                	push   $0x0
  pushl $177
  102523:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  102528:	e9 a8 03 00 00       	jmp    1028d5 <__alltraps>

0010252d <vector178>:
.globl vector178
vector178:
  pushl $0
  10252d:	6a 00                	push   $0x0
  pushl $178
  10252f:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102534:	e9 9c 03 00 00       	jmp    1028d5 <__alltraps>

00102539 <vector179>:
.globl vector179
vector179:
  pushl $0
  102539:	6a 00                	push   $0x0
  pushl $179
  10253b:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  102540:	e9 90 03 00 00       	jmp    1028d5 <__alltraps>

00102545 <vector180>:
.globl vector180
vector180:
  pushl $0
  102545:	6a 00                	push   $0x0
  pushl $180
  102547:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  10254c:	e9 84 03 00 00       	jmp    1028d5 <__alltraps>

00102551 <vector181>:
.globl vector181
vector181:
  pushl $0
  102551:	6a 00                	push   $0x0
  pushl $181
  102553:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  102558:	e9 78 03 00 00       	jmp    1028d5 <__alltraps>

0010255d <vector182>:
.globl vector182
vector182:
  pushl $0
  10255d:	6a 00                	push   $0x0
  pushl $182
  10255f:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  102564:	e9 6c 03 00 00       	jmp    1028d5 <__alltraps>

00102569 <vector183>:
.globl vector183
vector183:
  pushl $0
  102569:	6a 00                	push   $0x0
  pushl $183
  10256b:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  102570:	e9 60 03 00 00       	jmp    1028d5 <__alltraps>

00102575 <vector184>:
.globl vector184
vector184:
  pushl $0
  102575:	6a 00                	push   $0x0
  pushl $184
  102577:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  10257c:	e9 54 03 00 00       	jmp    1028d5 <__alltraps>

00102581 <vector185>:
.globl vector185
vector185:
  pushl $0
  102581:	6a 00                	push   $0x0
  pushl $185
  102583:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  102588:	e9 48 03 00 00       	jmp    1028d5 <__alltraps>

0010258d <vector186>:
.globl vector186
vector186:
  pushl $0
  10258d:	6a 00                	push   $0x0
  pushl $186
  10258f:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  102594:	e9 3c 03 00 00       	jmp    1028d5 <__alltraps>

00102599 <vector187>:
.globl vector187
vector187:
  pushl $0
  102599:	6a 00                	push   $0x0
  pushl $187
  10259b:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  1025a0:	e9 30 03 00 00       	jmp    1028d5 <__alltraps>

001025a5 <vector188>:
.globl vector188
vector188:
  pushl $0
  1025a5:	6a 00                	push   $0x0
  pushl $188
  1025a7:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  1025ac:	e9 24 03 00 00       	jmp    1028d5 <__alltraps>

001025b1 <vector189>:
.globl vector189
vector189:
  pushl $0
  1025b1:	6a 00                	push   $0x0
  pushl $189
  1025b3:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  1025b8:	e9 18 03 00 00       	jmp    1028d5 <__alltraps>

001025bd <vector190>:
.globl vector190
vector190:
  pushl $0
  1025bd:	6a 00                	push   $0x0
  pushl $190
  1025bf:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  1025c4:	e9 0c 03 00 00       	jmp    1028d5 <__alltraps>

001025c9 <vector191>:
.globl vector191
vector191:
  pushl $0
  1025c9:	6a 00                	push   $0x0
  pushl $191
  1025cb:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  1025d0:	e9 00 03 00 00       	jmp    1028d5 <__alltraps>

001025d5 <vector192>:
.globl vector192
vector192:
  pushl $0
  1025d5:	6a 00                	push   $0x0
  pushl $192
  1025d7:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  1025dc:	e9 f4 02 00 00       	jmp    1028d5 <__alltraps>

001025e1 <vector193>:
.globl vector193
vector193:
  pushl $0
  1025e1:	6a 00                	push   $0x0
  pushl $193
  1025e3:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  1025e8:	e9 e8 02 00 00       	jmp    1028d5 <__alltraps>

001025ed <vector194>:
.globl vector194
vector194:
  pushl $0
  1025ed:	6a 00                	push   $0x0
  pushl $194
  1025ef:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  1025f4:	e9 dc 02 00 00       	jmp    1028d5 <__alltraps>

001025f9 <vector195>:
.globl vector195
vector195:
  pushl $0
  1025f9:	6a 00                	push   $0x0
  pushl $195
  1025fb:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102600:	e9 d0 02 00 00       	jmp    1028d5 <__alltraps>

00102605 <vector196>:
.globl vector196
vector196:
  pushl $0
  102605:	6a 00                	push   $0x0
  pushl $196
  102607:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  10260c:	e9 c4 02 00 00       	jmp    1028d5 <__alltraps>

00102611 <vector197>:
.globl vector197
vector197:
  pushl $0
  102611:	6a 00                	push   $0x0
  pushl $197
  102613:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  102618:	e9 b8 02 00 00       	jmp    1028d5 <__alltraps>

0010261d <vector198>:
.globl vector198
vector198:
  pushl $0
  10261d:	6a 00                	push   $0x0
  pushl $198
  10261f:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102624:	e9 ac 02 00 00       	jmp    1028d5 <__alltraps>

00102629 <vector199>:
.globl vector199
vector199:
  pushl $0
  102629:	6a 00                	push   $0x0
  pushl $199
  10262b:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  102630:	e9 a0 02 00 00       	jmp    1028d5 <__alltraps>

00102635 <vector200>:
.globl vector200
vector200:
  pushl $0
  102635:	6a 00                	push   $0x0
  pushl $200
  102637:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  10263c:	e9 94 02 00 00       	jmp    1028d5 <__alltraps>

00102641 <vector201>:
.globl vector201
vector201:
  pushl $0
  102641:	6a 00                	push   $0x0
  pushl $201
  102643:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  102648:	e9 88 02 00 00       	jmp    1028d5 <__alltraps>

0010264d <vector202>:
.globl vector202
vector202:
  pushl $0
  10264d:	6a 00                	push   $0x0
  pushl $202
  10264f:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  102654:	e9 7c 02 00 00       	jmp    1028d5 <__alltraps>

00102659 <vector203>:
.globl vector203
vector203:
  pushl $0
  102659:	6a 00                	push   $0x0
  pushl $203
  10265b:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  102660:	e9 70 02 00 00       	jmp    1028d5 <__alltraps>

00102665 <vector204>:
.globl vector204
vector204:
  pushl $0
  102665:	6a 00                	push   $0x0
  pushl $204
  102667:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  10266c:	e9 64 02 00 00       	jmp    1028d5 <__alltraps>

00102671 <vector205>:
.globl vector205
vector205:
  pushl $0
  102671:	6a 00                	push   $0x0
  pushl $205
  102673:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  102678:	e9 58 02 00 00       	jmp    1028d5 <__alltraps>

0010267d <vector206>:
.globl vector206
vector206:
  pushl $0
  10267d:	6a 00                	push   $0x0
  pushl $206
  10267f:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  102684:	e9 4c 02 00 00       	jmp    1028d5 <__alltraps>

00102689 <vector207>:
.globl vector207
vector207:
  pushl $0
  102689:	6a 00                	push   $0x0
  pushl $207
  10268b:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  102690:	e9 40 02 00 00       	jmp    1028d5 <__alltraps>

00102695 <vector208>:
.globl vector208
vector208:
  pushl $0
  102695:	6a 00                	push   $0x0
  pushl $208
  102697:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  10269c:	e9 34 02 00 00       	jmp    1028d5 <__alltraps>

001026a1 <vector209>:
.globl vector209
vector209:
  pushl $0
  1026a1:	6a 00                	push   $0x0
  pushl $209
  1026a3:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  1026a8:	e9 28 02 00 00       	jmp    1028d5 <__alltraps>

001026ad <vector210>:
.globl vector210
vector210:
  pushl $0
  1026ad:	6a 00                	push   $0x0
  pushl $210
  1026af:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  1026b4:	e9 1c 02 00 00       	jmp    1028d5 <__alltraps>

001026b9 <vector211>:
.globl vector211
vector211:
  pushl $0
  1026b9:	6a 00                	push   $0x0
  pushl $211
  1026bb:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  1026c0:	e9 10 02 00 00       	jmp    1028d5 <__alltraps>

001026c5 <vector212>:
.globl vector212
vector212:
  pushl $0
  1026c5:	6a 00                	push   $0x0
  pushl $212
  1026c7:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  1026cc:	e9 04 02 00 00       	jmp    1028d5 <__alltraps>

001026d1 <vector213>:
.globl vector213
vector213:
  pushl $0
  1026d1:	6a 00                	push   $0x0
  pushl $213
  1026d3:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  1026d8:	e9 f8 01 00 00       	jmp    1028d5 <__alltraps>

001026dd <vector214>:
.globl vector214
vector214:
  pushl $0
  1026dd:	6a 00                	push   $0x0
  pushl $214
  1026df:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  1026e4:	e9 ec 01 00 00       	jmp    1028d5 <__alltraps>

001026e9 <vector215>:
.globl vector215
vector215:
  pushl $0
  1026e9:	6a 00                	push   $0x0
  pushl $215
  1026eb:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  1026f0:	e9 e0 01 00 00       	jmp    1028d5 <__alltraps>

001026f5 <vector216>:
.globl vector216
vector216:
  pushl $0
  1026f5:	6a 00                	push   $0x0
  pushl $216
  1026f7:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  1026fc:	e9 d4 01 00 00       	jmp    1028d5 <__alltraps>

00102701 <vector217>:
.globl vector217
vector217:
  pushl $0
  102701:	6a 00                	push   $0x0
  pushl $217
  102703:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  102708:	e9 c8 01 00 00       	jmp    1028d5 <__alltraps>

0010270d <vector218>:
.globl vector218
vector218:
  pushl $0
  10270d:	6a 00                	push   $0x0
  pushl $218
  10270f:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102714:	e9 bc 01 00 00       	jmp    1028d5 <__alltraps>

00102719 <vector219>:
.globl vector219
vector219:
  pushl $0
  102719:	6a 00                	push   $0x0
  pushl $219
  10271b:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102720:	e9 b0 01 00 00       	jmp    1028d5 <__alltraps>

00102725 <vector220>:
.globl vector220
vector220:
  pushl $0
  102725:	6a 00                	push   $0x0
  pushl $220
  102727:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  10272c:	e9 a4 01 00 00       	jmp    1028d5 <__alltraps>

00102731 <vector221>:
.globl vector221
vector221:
  pushl $0
  102731:	6a 00                	push   $0x0
  pushl $221
  102733:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  102738:	e9 98 01 00 00       	jmp    1028d5 <__alltraps>

0010273d <vector222>:
.globl vector222
vector222:
  pushl $0
  10273d:	6a 00                	push   $0x0
  pushl $222
  10273f:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  102744:	e9 8c 01 00 00       	jmp    1028d5 <__alltraps>

00102749 <vector223>:
.globl vector223
vector223:
  pushl $0
  102749:	6a 00                	push   $0x0
  pushl $223
  10274b:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  102750:	e9 80 01 00 00       	jmp    1028d5 <__alltraps>

00102755 <vector224>:
.globl vector224
vector224:
  pushl $0
  102755:	6a 00                	push   $0x0
  pushl $224
  102757:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  10275c:	e9 74 01 00 00       	jmp    1028d5 <__alltraps>

00102761 <vector225>:
.globl vector225
vector225:
  pushl $0
  102761:	6a 00                	push   $0x0
  pushl $225
  102763:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  102768:	e9 68 01 00 00       	jmp    1028d5 <__alltraps>

0010276d <vector226>:
.globl vector226
vector226:
  pushl $0
  10276d:	6a 00                	push   $0x0
  pushl $226
  10276f:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  102774:	e9 5c 01 00 00       	jmp    1028d5 <__alltraps>

00102779 <vector227>:
.globl vector227
vector227:
  pushl $0
  102779:	6a 00                	push   $0x0
  pushl $227
  10277b:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  102780:	e9 50 01 00 00       	jmp    1028d5 <__alltraps>

00102785 <vector228>:
.globl vector228
vector228:
  pushl $0
  102785:	6a 00                	push   $0x0
  pushl $228
  102787:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  10278c:	e9 44 01 00 00       	jmp    1028d5 <__alltraps>

00102791 <vector229>:
.globl vector229
vector229:
  pushl $0
  102791:	6a 00                	push   $0x0
  pushl $229
  102793:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  102798:	e9 38 01 00 00       	jmp    1028d5 <__alltraps>

0010279d <vector230>:
.globl vector230
vector230:
  pushl $0
  10279d:	6a 00                	push   $0x0
  pushl $230
  10279f:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  1027a4:	e9 2c 01 00 00       	jmp    1028d5 <__alltraps>

001027a9 <vector231>:
.globl vector231
vector231:
  pushl $0
  1027a9:	6a 00                	push   $0x0
  pushl $231
  1027ab:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  1027b0:	e9 20 01 00 00       	jmp    1028d5 <__alltraps>

001027b5 <vector232>:
.globl vector232
vector232:
  pushl $0
  1027b5:	6a 00                	push   $0x0
  pushl $232
  1027b7:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  1027bc:	e9 14 01 00 00       	jmp    1028d5 <__alltraps>

001027c1 <vector233>:
.globl vector233
vector233:
  pushl $0
  1027c1:	6a 00                	push   $0x0
  pushl $233
  1027c3:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  1027c8:	e9 08 01 00 00       	jmp    1028d5 <__alltraps>

001027cd <vector234>:
.globl vector234
vector234:
  pushl $0
  1027cd:	6a 00                	push   $0x0
  pushl $234
  1027cf:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  1027d4:	e9 fc 00 00 00       	jmp    1028d5 <__alltraps>

001027d9 <vector235>:
.globl vector235
vector235:
  pushl $0
  1027d9:	6a 00                	push   $0x0
  pushl $235
  1027db:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  1027e0:	e9 f0 00 00 00       	jmp    1028d5 <__alltraps>

001027e5 <vector236>:
.globl vector236
vector236:
  pushl $0
  1027e5:	6a 00                	push   $0x0
  pushl $236
  1027e7:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  1027ec:	e9 e4 00 00 00       	jmp    1028d5 <__alltraps>

001027f1 <vector237>:
.globl vector237
vector237:
  pushl $0
  1027f1:	6a 00                	push   $0x0
  pushl $237
  1027f3:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  1027f8:	e9 d8 00 00 00       	jmp    1028d5 <__alltraps>

001027fd <vector238>:
.globl vector238
vector238:
  pushl $0
  1027fd:	6a 00                	push   $0x0
  pushl $238
  1027ff:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102804:	e9 cc 00 00 00       	jmp    1028d5 <__alltraps>

00102809 <vector239>:
.globl vector239
vector239:
  pushl $0
  102809:	6a 00                	push   $0x0
  pushl $239
  10280b:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102810:	e9 c0 00 00 00       	jmp    1028d5 <__alltraps>

00102815 <vector240>:
.globl vector240
vector240:
  pushl $0
  102815:	6a 00                	push   $0x0
  pushl $240
  102817:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  10281c:	e9 b4 00 00 00       	jmp    1028d5 <__alltraps>

00102821 <vector241>:
.globl vector241
vector241:
  pushl $0
  102821:	6a 00                	push   $0x0
  pushl $241
  102823:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  102828:	e9 a8 00 00 00       	jmp    1028d5 <__alltraps>

0010282d <vector242>:
.globl vector242
vector242:
  pushl $0
  10282d:	6a 00                	push   $0x0
  pushl $242
  10282f:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102834:	e9 9c 00 00 00       	jmp    1028d5 <__alltraps>

00102839 <vector243>:
.globl vector243
vector243:
  pushl $0
  102839:	6a 00                	push   $0x0
  pushl $243
  10283b:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  102840:	e9 90 00 00 00       	jmp    1028d5 <__alltraps>

00102845 <vector244>:
.globl vector244
vector244:
  pushl $0
  102845:	6a 00                	push   $0x0
  pushl $244
  102847:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  10284c:	e9 84 00 00 00       	jmp    1028d5 <__alltraps>

00102851 <vector245>:
.globl vector245
vector245:
  pushl $0
  102851:	6a 00                	push   $0x0
  pushl $245
  102853:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  102858:	e9 78 00 00 00       	jmp    1028d5 <__alltraps>

0010285d <vector246>:
.globl vector246
vector246:
  pushl $0
  10285d:	6a 00                	push   $0x0
  pushl $246
  10285f:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  102864:	e9 6c 00 00 00       	jmp    1028d5 <__alltraps>

00102869 <vector247>:
.globl vector247
vector247:
  pushl $0
  102869:	6a 00                	push   $0x0
  pushl $247
  10286b:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  102870:	e9 60 00 00 00       	jmp    1028d5 <__alltraps>

00102875 <vector248>:
.globl vector248
vector248:
  pushl $0
  102875:	6a 00                	push   $0x0
  pushl $248
  102877:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  10287c:	e9 54 00 00 00       	jmp    1028d5 <__alltraps>

00102881 <vector249>:
.globl vector249
vector249:
  pushl $0
  102881:	6a 00                	push   $0x0
  pushl $249
  102883:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  102888:	e9 48 00 00 00       	jmp    1028d5 <__alltraps>

0010288d <vector250>:
.globl vector250
vector250:
  pushl $0
  10288d:	6a 00                	push   $0x0
  pushl $250
  10288f:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  102894:	e9 3c 00 00 00       	jmp    1028d5 <__alltraps>

00102899 <vector251>:
.globl vector251
vector251:
  pushl $0
  102899:	6a 00                	push   $0x0
  pushl $251
  10289b:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  1028a0:	e9 30 00 00 00       	jmp    1028d5 <__alltraps>

001028a5 <vector252>:
.globl vector252
vector252:
  pushl $0
  1028a5:	6a 00                	push   $0x0
  pushl $252
  1028a7:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  1028ac:	e9 24 00 00 00       	jmp    1028d5 <__alltraps>

001028b1 <vector253>:
.globl vector253
vector253:
  pushl $0
  1028b1:	6a 00                	push   $0x0
  pushl $253
  1028b3:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  1028b8:	e9 18 00 00 00       	jmp    1028d5 <__alltraps>

001028bd <vector254>:
.globl vector254
vector254:
  pushl $0
  1028bd:	6a 00                	push   $0x0
  pushl $254
  1028bf:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  1028c4:	e9 0c 00 00 00       	jmp    1028d5 <__alltraps>

001028c9 <vector255>:
.globl vector255
vector255:
  pushl $0
  1028c9:	6a 00                	push   $0x0
  pushl $255
  1028cb:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  1028d0:	e9 00 00 00 00       	jmp    1028d5 <__alltraps>

001028d5 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  1028d5:	1e                   	push   %ds
    pushl %es
  1028d6:	06                   	push   %es
    pushl %fs
  1028d7:	0f a0                	push   %fs
    pushl %gs
  1028d9:	0f a8                	push   %gs
    pushal
  1028db:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  1028dc:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  1028e1:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  1028e3:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  1028e5:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  1028e6:	e8 64 f5 ff ff       	call   101e4f <trap>

    # pop the pushed stack pointer
    popl %esp
  1028eb:	5c                   	pop    %esp

001028ec <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  1028ec:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  1028ed:	0f a9                	pop    %gs
    popl %fs
  1028ef:	0f a1                	pop    %fs
    popl %es
  1028f1:	07                   	pop    %es
    popl %ds
  1028f2:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  1028f3:	83 c4 08             	add    $0x8,%esp
    iret
  1028f6:	cf                   	iret   

001028f7 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  1028f7:	55                   	push   %ebp
  1028f8:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  1028fa:	8b 45 08             	mov    0x8(%ebp),%eax
  1028fd:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102900:	b8 23 00 00 00       	mov    $0x23,%eax
  102905:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102907:	b8 23 00 00 00       	mov    $0x23,%eax
  10290c:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  10290e:	b8 10 00 00 00       	mov    $0x10,%eax
  102913:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102915:	b8 10 00 00 00       	mov    $0x10,%eax
  10291a:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  10291c:	b8 10 00 00 00       	mov    $0x10,%eax
  102921:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102923:	ea 2a 29 10 00 08 00 	ljmp   $0x8,$0x10292a
}
  10292a:	5d                   	pop    %ebp
  10292b:	c3                   	ret    

0010292c <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  10292c:	55                   	push   %ebp
  10292d:	89 e5                	mov    %esp,%ebp
  10292f:	83 ec 10             	sub    $0x10,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102932:	b8 80 fa 10 00       	mov    $0x10fa80,%eax
  102937:	05 00 04 00 00       	add    $0x400,%eax
  10293c:	a3 84 f9 10 00       	mov    %eax,0x10f984
    ts.ts_ss0 = KERNEL_DS;
  102941:	66 c7 05 88 f9 10 00 	movw   $0x10,0x10f988
  102948:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  10294a:	66 c7 05 48 ea 10 00 	movw   $0x68,0x10ea48
  102951:	68 00 
  102953:	b8 80 f9 10 00       	mov    $0x10f980,%eax
  102958:	66 a3 4a ea 10 00    	mov    %ax,0x10ea4a
  10295e:	b8 80 f9 10 00       	mov    $0x10f980,%eax
  102963:	c1 e8 10             	shr    $0x10,%eax
  102966:	a2 4c ea 10 00       	mov    %al,0x10ea4c
  10296b:	0f b6 05 4d ea 10 00 	movzbl 0x10ea4d,%eax
  102972:	83 e0 f0             	and    $0xfffffff0,%eax
  102975:	83 c8 09             	or     $0x9,%eax
  102978:	a2 4d ea 10 00       	mov    %al,0x10ea4d
  10297d:	0f b6 05 4d ea 10 00 	movzbl 0x10ea4d,%eax
  102984:	83 c8 10             	or     $0x10,%eax
  102987:	a2 4d ea 10 00       	mov    %al,0x10ea4d
  10298c:	0f b6 05 4d ea 10 00 	movzbl 0x10ea4d,%eax
  102993:	83 e0 9f             	and    $0xffffff9f,%eax
  102996:	a2 4d ea 10 00       	mov    %al,0x10ea4d
  10299b:	0f b6 05 4d ea 10 00 	movzbl 0x10ea4d,%eax
  1029a2:	83 c8 80             	or     $0xffffff80,%eax
  1029a5:	a2 4d ea 10 00       	mov    %al,0x10ea4d
  1029aa:	0f b6 05 4e ea 10 00 	movzbl 0x10ea4e,%eax
  1029b1:	83 e0 f0             	and    $0xfffffff0,%eax
  1029b4:	a2 4e ea 10 00       	mov    %al,0x10ea4e
  1029b9:	0f b6 05 4e ea 10 00 	movzbl 0x10ea4e,%eax
  1029c0:	83 e0 ef             	and    $0xffffffef,%eax
  1029c3:	a2 4e ea 10 00       	mov    %al,0x10ea4e
  1029c8:	0f b6 05 4e ea 10 00 	movzbl 0x10ea4e,%eax
  1029cf:	83 e0 df             	and    $0xffffffdf,%eax
  1029d2:	a2 4e ea 10 00       	mov    %al,0x10ea4e
  1029d7:	0f b6 05 4e ea 10 00 	movzbl 0x10ea4e,%eax
  1029de:	83 c8 40             	or     $0x40,%eax
  1029e1:	a2 4e ea 10 00       	mov    %al,0x10ea4e
  1029e6:	0f b6 05 4e ea 10 00 	movzbl 0x10ea4e,%eax
  1029ed:	83 e0 7f             	and    $0x7f,%eax
  1029f0:	a2 4e ea 10 00       	mov    %al,0x10ea4e
  1029f5:	b8 80 f9 10 00       	mov    $0x10f980,%eax
  1029fa:	c1 e8 18             	shr    $0x18,%eax
  1029fd:	a2 4f ea 10 00       	mov    %al,0x10ea4f
    gdt[SEG_TSS].sd_s = 0;
  102a02:	0f b6 05 4d ea 10 00 	movzbl 0x10ea4d,%eax
  102a09:	83 e0 ef             	and    $0xffffffef,%eax
  102a0c:	a2 4d ea 10 00       	mov    %al,0x10ea4d

    // reload all segment registers
    lgdt(&gdt_pd);
  102a11:	68 50 ea 10 00       	push   $0x10ea50
  102a16:	e8 dc fe ff ff       	call   1028f7 <lgdt>
  102a1b:	83 c4 04             	add    $0x4,%esp
  102a1e:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102a24:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102a28:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  102a2b:	c9                   	leave  
  102a2c:	c3                   	ret    

00102a2d <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102a2d:	55                   	push   %ebp
  102a2e:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102a30:	e8 f7 fe ff ff       	call   10292c <gdt_init>
}
  102a35:	5d                   	pop    %ebp
  102a36:	c3                   	ret    

00102a37 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102a37:	55                   	push   %ebp
  102a38:	89 e5                	mov    %esp,%ebp
  102a3a:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102a3d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102a44:	eb 04                	jmp    102a4a <strlen+0x13>
        cnt ++;
  102a46:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    while (*s ++ != '\0') {
  102a4a:	8b 45 08             	mov    0x8(%ebp),%eax
  102a4d:	8d 50 01             	lea    0x1(%eax),%edx
  102a50:	89 55 08             	mov    %edx,0x8(%ebp)
  102a53:	0f b6 00             	movzbl (%eax),%eax
  102a56:	84 c0                	test   %al,%al
  102a58:	75 ec                	jne    102a46 <strlen+0xf>
    }
    return cnt;
  102a5a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102a5d:	c9                   	leave  
  102a5e:	c3                   	ret    

00102a5f <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102a5f:	55                   	push   %ebp
  102a60:	89 e5                	mov    %esp,%ebp
  102a62:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102a65:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102a6c:	eb 04                	jmp    102a72 <strnlen+0x13>
        cnt ++;
  102a6e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102a72:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102a75:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102a78:	73 10                	jae    102a8a <strnlen+0x2b>
  102a7a:	8b 45 08             	mov    0x8(%ebp),%eax
  102a7d:	8d 50 01             	lea    0x1(%eax),%edx
  102a80:	89 55 08             	mov    %edx,0x8(%ebp)
  102a83:	0f b6 00             	movzbl (%eax),%eax
  102a86:	84 c0                	test   %al,%al
  102a88:	75 e4                	jne    102a6e <strnlen+0xf>
    }
    return cnt;
  102a8a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102a8d:	c9                   	leave  
  102a8e:	c3                   	ret    

00102a8f <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102a8f:	55                   	push   %ebp
  102a90:	89 e5                	mov    %esp,%ebp
  102a92:	57                   	push   %edi
  102a93:	56                   	push   %esi
  102a94:	83 ec 20             	sub    $0x20,%esp
  102a97:	8b 45 08             	mov    0x8(%ebp),%eax
  102a9a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102a9d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102aa0:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102aa3:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102aa6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102aa9:	89 d1                	mov    %edx,%ecx
  102aab:	89 c2                	mov    %eax,%edx
  102aad:	89 ce                	mov    %ecx,%esi
  102aaf:	89 d7                	mov    %edx,%edi
  102ab1:	ac                   	lods   %ds:(%esi),%al
  102ab2:	aa                   	stos   %al,%es:(%edi)
  102ab3:	84 c0                	test   %al,%al
  102ab5:	75 fa                	jne    102ab1 <strcpy+0x22>
  102ab7:	89 fa                	mov    %edi,%edx
  102ab9:	89 f1                	mov    %esi,%ecx
  102abb:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102abe:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102ac1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102ac4:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_STRCPY
    return __strcpy(dst, src);
  102ac7:	90                   	nop
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102ac8:	83 c4 20             	add    $0x20,%esp
  102acb:	5e                   	pop    %esi
  102acc:	5f                   	pop    %edi
  102acd:	5d                   	pop    %ebp
  102ace:	c3                   	ret    

00102acf <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102acf:	55                   	push   %ebp
  102ad0:	89 e5                	mov    %esp,%ebp
  102ad2:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102ad5:	8b 45 08             	mov    0x8(%ebp),%eax
  102ad8:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102adb:	eb 21                	jmp    102afe <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  102add:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ae0:	0f b6 10             	movzbl (%eax),%edx
  102ae3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ae6:	88 10                	mov    %dl,(%eax)
  102ae8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102aeb:	0f b6 00             	movzbl (%eax),%eax
  102aee:	84 c0                	test   %al,%al
  102af0:	74 04                	je     102af6 <strncpy+0x27>
            src ++;
  102af2:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  102af6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102afa:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    while (len > 0) {
  102afe:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102b02:	75 d9                	jne    102add <strncpy+0xe>
    }
    return dst;
  102b04:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102b07:	c9                   	leave  
  102b08:	c3                   	ret    

00102b09 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102b09:	55                   	push   %ebp
  102b0a:	89 e5                	mov    %esp,%ebp
  102b0c:	57                   	push   %edi
  102b0d:	56                   	push   %esi
  102b0e:	83 ec 20             	sub    $0x20,%esp
  102b11:	8b 45 08             	mov    0x8(%ebp),%eax
  102b14:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b17:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b1a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  102b1d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102b20:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b23:	89 d1                	mov    %edx,%ecx
  102b25:	89 c2                	mov    %eax,%edx
  102b27:	89 ce                	mov    %ecx,%esi
  102b29:	89 d7                	mov    %edx,%edi
  102b2b:	ac                   	lods   %ds:(%esi),%al
  102b2c:	ae                   	scas   %es:(%edi),%al
  102b2d:	75 08                	jne    102b37 <strcmp+0x2e>
  102b2f:	84 c0                	test   %al,%al
  102b31:	75 f8                	jne    102b2b <strcmp+0x22>
  102b33:	31 c0                	xor    %eax,%eax
  102b35:	eb 04                	jmp    102b3b <strcmp+0x32>
  102b37:	19 c0                	sbb    %eax,%eax
  102b39:	0c 01                	or     $0x1,%al
  102b3b:	89 fa                	mov    %edi,%edx
  102b3d:	89 f1                	mov    %esi,%ecx
  102b3f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102b42:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102b45:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  102b48:	8b 45 ec             	mov    -0x14(%ebp),%eax
#ifdef __HAVE_ARCH_STRCMP
    return __strcmp(s1, s2);
  102b4b:	90                   	nop
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102b4c:	83 c4 20             	add    $0x20,%esp
  102b4f:	5e                   	pop    %esi
  102b50:	5f                   	pop    %edi
  102b51:	5d                   	pop    %ebp
  102b52:	c3                   	ret    

00102b53 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102b53:	55                   	push   %ebp
  102b54:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102b56:	eb 0c                	jmp    102b64 <strncmp+0x11>
        n --, s1 ++, s2 ++;
  102b58:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102b5c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102b60:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102b64:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102b68:	74 1a                	je     102b84 <strncmp+0x31>
  102b6a:	8b 45 08             	mov    0x8(%ebp),%eax
  102b6d:	0f b6 00             	movzbl (%eax),%eax
  102b70:	84 c0                	test   %al,%al
  102b72:	74 10                	je     102b84 <strncmp+0x31>
  102b74:	8b 45 08             	mov    0x8(%ebp),%eax
  102b77:	0f b6 10             	movzbl (%eax),%edx
  102b7a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b7d:	0f b6 00             	movzbl (%eax),%eax
  102b80:	38 c2                	cmp    %al,%dl
  102b82:	74 d4                	je     102b58 <strncmp+0x5>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102b84:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102b88:	74 18                	je     102ba2 <strncmp+0x4f>
  102b8a:	8b 45 08             	mov    0x8(%ebp),%eax
  102b8d:	0f b6 00             	movzbl (%eax),%eax
  102b90:	0f b6 d0             	movzbl %al,%edx
  102b93:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b96:	0f b6 00             	movzbl (%eax),%eax
  102b99:	0f b6 c0             	movzbl %al,%eax
  102b9c:	29 c2                	sub    %eax,%edx
  102b9e:	89 d0                	mov    %edx,%eax
  102ba0:	eb 05                	jmp    102ba7 <strncmp+0x54>
  102ba2:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102ba7:	5d                   	pop    %ebp
  102ba8:	c3                   	ret    

00102ba9 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102ba9:	55                   	push   %ebp
  102baa:	89 e5                	mov    %esp,%ebp
  102bac:	83 ec 04             	sub    $0x4,%esp
  102baf:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bb2:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102bb5:	eb 14                	jmp    102bcb <strchr+0x22>
        if (*s == c) {
  102bb7:	8b 45 08             	mov    0x8(%ebp),%eax
  102bba:	0f b6 00             	movzbl (%eax),%eax
  102bbd:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102bc0:	75 05                	jne    102bc7 <strchr+0x1e>
            return (char *)s;
  102bc2:	8b 45 08             	mov    0x8(%ebp),%eax
  102bc5:	eb 13                	jmp    102bda <strchr+0x31>
        }
        s ++;
  102bc7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s != '\0') {
  102bcb:	8b 45 08             	mov    0x8(%ebp),%eax
  102bce:	0f b6 00             	movzbl (%eax),%eax
  102bd1:	84 c0                	test   %al,%al
  102bd3:	75 e2                	jne    102bb7 <strchr+0xe>
    }
    return NULL;
  102bd5:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102bda:	c9                   	leave  
  102bdb:	c3                   	ret    

00102bdc <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102bdc:	55                   	push   %ebp
  102bdd:	89 e5                	mov    %esp,%ebp
  102bdf:	83 ec 04             	sub    $0x4,%esp
  102be2:	8b 45 0c             	mov    0xc(%ebp),%eax
  102be5:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102be8:	eb 11                	jmp    102bfb <strfind+0x1f>
        if (*s == c) {
  102bea:	8b 45 08             	mov    0x8(%ebp),%eax
  102bed:	0f b6 00             	movzbl (%eax),%eax
  102bf0:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102bf3:	75 02                	jne    102bf7 <strfind+0x1b>
            break;
  102bf5:	eb 0e                	jmp    102c05 <strfind+0x29>
        }
        s ++;
  102bf7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s != '\0') {
  102bfb:	8b 45 08             	mov    0x8(%ebp),%eax
  102bfe:	0f b6 00             	movzbl (%eax),%eax
  102c01:	84 c0                	test   %al,%al
  102c03:	75 e5                	jne    102bea <strfind+0xe>
    }
    return (char *)s;
  102c05:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102c08:	c9                   	leave  
  102c09:	c3                   	ret    

00102c0a <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102c0a:	55                   	push   %ebp
  102c0b:	89 e5                	mov    %esp,%ebp
  102c0d:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102c10:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102c17:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102c1e:	eb 04                	jmp    102c24 <strtol+0x1a>
        s ++;
  102c20:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  102c24:	8b 45 08             	mov    0x8(%ebp),%eax
  102c27:	0f b6 00             	movzbl (%eax),%eax
  102c2a:	3c 20                	cmp    $0x20,%al
  102c2c:	74 f2                	je     102c20 <strtol+0x16>
  102c2e:	8b 45 08             	mov    0x8(%ebp),%eax
  102c31:	0f b6 00             	movzbl (%eax),%eax
  102c34:	3c 09                	cmp    $0x9,%al
  102c36:	74 e8                	je     102c20 <strtol+0x16>
    }

    // plus/minus sign
    if (*s == '+') {
  102c38:	8b 45 08             	mov    0x8(%ebp),%eax
  102c3b:	0f b6 00             	movzbl (%eax),%eax
  102c3e:	3c 2b                	cmp    $0x2b,%al
  102c40:	75 06                	jne    102c48 <strtol+0x3e>
        s ++;
  102c42:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102c46:	eb 15                	jmp    102c5d <strtol+0x53>
    }
    else if (*s == '-') {
  102c48:	8b 45 08             	mov    0x8(%ebp),%eax
  102c4b:	0f b6 00             	movzbl (%eax),%eax
  102c4e:	3c 2d                	cmp    $0x2d,%al
  102c50:	75 0b                	jne    102c5d <strtol+0x53>
        s ++, neg = 1;
  102c52:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102c56:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102c5d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102c61:	74 06                	je     102c69 <strtol+0x5f>
  102c63:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102c67:	75 24                	jne    102c8d <strtol+0x83>
  102c69:	8b 45 08             	mov    0x8(%ebp),%eax
  102c6c:	0f b6 00             	movzbl (%eax),%eax
  102c6f:	3c 30                	cmp    $0x30,%al
  102c71:	75 1a                	jne    102c8d <strtol+0x83>
  102c73:	8b 45 08             	mov    0x8(%ebp),%eax
  102c76:	83 c0 01             	add    $0x1,%eax
  102c79:	0f b6 00             	movzbl (%eax),%eax
  102c7c:	3c 78                	cmp    $0x78,%al
  102c7e:	75 0d                	jne    102c8d <strtol+0x83>
        s += 2, base = 16;
  102c80:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102c84:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102c8b:	eb 2a                	jmp    102cb7 <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  102c8d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102c91:	75 17                	jne    102caa <strtol+0xa0>
  102c93:	8b 45 08             	mov    0x8(%ebp),%eax
  102c96:	0f b6 00             	movzbl (%eax),%eax
  102c99:	3c 30                	cmp    $0x30,%al
  102c9b:	75 0d                	jne    102caa <strtol+0xa0>
        s ++, base = 8;
  102c9d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102ca1:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102ca8:	eb 0d                	jmp    102cb7 <strtol+0xad>
    }
    else if (base == 0) {
  102caa:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102cae:	75 07                	jne    102cb7 <strtol+0xad>
        base = 10;
  102cb0:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102cb7:	8b 45 08             	mov    0x8(%ebp),%eax
  102cba:	0f b6 00             	movzbl (%eax),%eax
  102cbd:	3c 2f                	cmp    $0x2f,%al
  102cbf:	7e 1b                	jle    102cdc <strtol+0xd2>
  102cc1:	8b 45 08             	mov    0x8(%ebp),%eax
  102cc4:	0f b6 00             	movzbl (%eax),%eax
  102cc7:	3c 39                	cmp    $0x39,%al
  102cc9:	7f 11                	jg     102cdc <strtol+0xd2>
            dig = *s - '0';
  102ccb:	8b 45 08             	mov    0x8(%ebp),%eax
  102cce:	0f b6 00             	movzbl (%eax),%eax
  102cd1:	0f be c0             	movsbl %al,%eax
  102cd4:	83 e8 30             	sub    $0x30,%eax
  102cd7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102cda:	eb 48                	jmp    102d24 <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102cdc:	8b 45 08             	mov    0x8(%ebp),%eax
  102cdf:	0f b6 00             	movzbl (%eax),%eax
  102ce2:	3c 60                	cmp    $0x60,%al
  102ce4:	7e 1b                	jle    102d01 <strtol+0xf7>
  102ce6:	8b 45 08             	mov    0x8(%ebp),%eax
  102ce9:	0f b6 00             	movzbl (%eax),%eax
  102cec:	3c 7a                	cmp    $0x7a,%al
  102cee:	7f 11                	jg     102d01 <strtol+0xf7>
            dig = *s - 'a' + 10;
  102cf0:	8b 45 08             	mov    0x8(%ebp),%eax
  102cf3:	0f b6 00             	movzbl (%eax),%eax
  102cf6:	0f be c0             	movsbl %al,%eax
  102cf9:	83 e8 57             	sub    $0x57,%eax
  102cfc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102cff:	eb 23                	jmp    102d24 <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102d01:	8b 45 08             	mov    0x8(%ebp),%eax
  102d04:	0f b6 00             	movzbl (%eax),%eax
  102d07:	3c 40                	cmp    $0x40,%al
  102d09:	7e 3d                	jle    102d48 <strtol+0x13e>
  102d0b:	8b 45 08             	mov    0x8(%ebp),%eax
  102d0e:	0f b6 00             	movzbl (%eax),%eax
  102d11:	3c 5a                	cmp    $0x5a,%al
  102d13:	7f 33                	jg     102d48 <strtol+0x13e>
            dig = *s - 'A' + 10;
  102d15:	8b 45 08             	mov    0x8(%ebp),%eax
  102d18:	0f b6 00             	movzbl (%eax),%eax
  102d1b:	0f be c0             	movsbl %al,%eax
  102d1e:	83 e8 37             	sub    $0x37,%eax
  102d21:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102d24:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d27:	3b 45 10             	cmp    0x10(%ebp),%eax
  102d2a:	7c 02                	jl     102d2e <strtol+0x124>
            break;
  102d2c:	eb 1a                	jmp    102d48 <strtol+0x13e>
        }
        s ++, val = (val * base) + dig;
  102d2e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102d32:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102d35:	0f af 45 10          	imul   0x10(%ebp),%eax
  102d39:	89 c2                	mov    %eax,%edx
  102d3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d3e:	01 d0                	add    %edx,%eax
  102d40:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  102d43:	e9 6f ff ff ff       	jmp    102cb7 <strtol+0xad>

    if (endptr) {
  102d48:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102d4c:	74 08                	je     102d56 <strtol+0x14c>
        *endptr = (char *) s;
  102d4e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d51:	8b 55 08             	mov    0x8(%ebp),%edx
  102d54:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102d56:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102d5a:	74 07                	je     102d63 <strtol+0x159>
  102d5c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102d5f:	f7 d8                	neg    %eax
  102d61:	eb 03                	jmp    102d66 <strtol+0x15c>
  102d63:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102d66:	c9                   	leave  
  102d67:	c3                   	ret    

00102d68 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102d68:	55                   	push   %ebp
  102d69:	89 e5                	mov    %esp,%ebp
  102d6b:	57                   	push   %edi
  102d6c:	83 ec 24             	sub    $0x24,%esp
  102d6f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d72:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102d75:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  102d79:	8b 55 08             	mov    0x8(%ebp),%edx
  102d7c:	89 55 f8             	mov    %edx,-0x8(%ebp)
  102d7f:	88 45 f7             	mov    %al,-0x9(%ebp)
  102d82:	8b 45 10             	mov    0x10(%ebp),%eax
  102d85:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102d88:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102d8b:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102d8f:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102d92:	89 d7                	mov    %edx,%edi
  102d94:	f3 aa                	rep stos %al,%es:(%edi)
  102d96:	89 fa                	mov    %edi,%edx
  102d98:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102d9b:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102d9e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102da1:	90                   	nop
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102da2:	83 c4 24             	add    $0x24,%esp
  102da5:	5f                   	pop    %edi
  102da6:	5d                   	pop    %ebp
  102da7:	c3                   	ret    

00102da8 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102da8:	55                   	push   %ebp
  102da9:	89 e5                	mov    %esp,%ebp
  102dab:	57                   	push   %edi
  102dac:	56                   	push   %esi
  102dad:	53                   	push   %ebx
  102dae:	83 ec 30             	sub    $0x30,%esp
  102db1:	8b 45 08             	mov    0x8(%ebp),%eax
  102db4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102db7:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dba:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102dbd:	8b 45 10             	mov    0x10(%ebp),%eax
  102dc0:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102dc3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102dc6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102dc9:	73 42                	jae    102e0d <memmove+0x65>
  102dcb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102dce:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102dd1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102dd4:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102dd7:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102dda:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102ddd:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102de0:	c1 e8 02             	shr    $0x2,%eax
  102de3:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102de5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102de8:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102deb:	89 d7                	mov    %edx,%edi
  102ded:	89 c6                	mov    %eax,%esi
  102def:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102df1:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102df4:	83 e1 03             	and    $0x3,%ecx
  102df7:	74 02                	je     102dfb <memmove+0x53>
  102df9:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102dfb:	89 f0                	mov    %esi,%eax
  102dfd:	89 fa                	mov    %edi,%edx
  102dff:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102e02:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102e05:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  102e08:	8b 45 e4             	mov    -0x1c(%ebp),%eax
#ifdef __HAVE_ARCH_MEMMOVE
    return __memmove(dst, src, n);
  102e0b:	eb 36                	jmp    102e43 <memmove+0x9b>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102e0d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e10:	8d 50 ff             	lea    -0x1(%eax),%edx
  102e13:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e16:	01 c2                	add    %eax,%edx
  102e18:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e1b:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102e1e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e21:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  102e24:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e27:	89 c1                	mov    %eax,%ecx
  102e29:	89 d8                	mov    %ebx,%eax
  102e2b:	89 d6                	mov    %edx,%esi
  102e2d:	89 c7                	mov    %eax,%edi
  102e2f:	fd                   	std    
  102e30:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102e32:	fc                   	cld    
  102e33:	89 f8                	mov    %edi,%eax
  102e35:	89 f2                	mov    %esi,%edx
  102e37:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102e3a:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102e3d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  102e40:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102e43:	83 c4 30             	add    $0x30,%esp
  102e46:	5b                   	pop    %ebx
  102e47:	5e                   	pop    %esi
  102e48:	5f                   	pop    %edi
  102e49:	5d                   	pop    %ebp
  102e4a:	c3                   	ret    

00102e4b <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102e4b:	55                   	push   %ebp
  102e4c:	89 e5                	mov    %esp,%ebp
  102e4e:	57                   	push   %edi
  102e4f:	56                   	push   %esi
  102e50:	83 ec 20             	sub    $0x20,%esp
  102e53:	8b 45 08             	mov    0x8(%ebp),%eax
  102e56:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102e59:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e5c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e5f:	8b 45 10             	mov    0x10(%ebp),%eax
  102e62:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102e65:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e68:	c1 e8 02             	shr    $0x2,%eax
  102e6b:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102e6d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102e70:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e73:	89 d7                	mov    %edx,%edi
  102e75:	89 c6                	mov    %eax,%esi
  102e77:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102e79:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102e7c:	83 e1 03             	and    $0x3,%ecx
  102e7f:	74 02                	je     102e83 <memcpy+0x38>
  102e81:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102e83:	89 f0                	mov    %esi,%eax
  102e85:	89 fa                	mov    %edi,%edx
  102e87:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102e8a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102e8d:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  102e90:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_MEMCPY
    return __memcpy(dst, src, n);
  102e93:	90                   	nop
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102e94:	83 c4 20             	add    $0x20,%esp
  102e97:	5e                   	pop    %esi
  102e98:	5f                   	pop    %edi
  102e99:	5d                   	pop    %ebp
  102e9a:	c3                   	ret    

00102e9b <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102e9b:	55                   	push   %ebp
  102e9c:	89 e5                	mov    %esp,%ebp
  102e9e:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  102ea1:	8b 45 08             	mov    0x8(%ebp),%eax
  102ea4:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102ea7:	8b 45 0c             	mov    0xc(%ebp),%eax
  102eaa:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102ead:	eb 30                	jmp    102edf <memcmp+0x44>
        if (*s1 != *s2) {
  102eaf:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102eb2:	0f b6 10             	movzbl (%eax),%edx
  102eb5:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102eb8:	0f b6 00             	movzbl (%eax),%eax
  102ebb:	38 c2                	cmp    %al,%dl
  102ebd:	74 18                	je     102ed7 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  102ebf:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ec2:	0f b6 00             	movzbl (%eax),%eax
  102ec5:	0f b6 d0             	movzbl %al,%edx
  102ec8:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102ecb:	0f b6 00             	movzbl (%eax),%eax
  102ece:	0f b6 c0             	movzbl %al,%eax
  102ed1:	29 c2                	sub    %eax,%edx
  102ed3:	89 d0                	mov    %edx,%eax
  102ed5:	eb 1a                	jmp    102ef1 <memcmp+0x56>
        }
        s1 ++, s2 ++;
  102ed7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102edb:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    while (n -- > 0) {
  102edf:	8b 45 10             	mov    0x10(%ebp),%eax
  102ee2:	8d 50 ff             	lea    -0x1(%eax),%edx
  102ee5:	89 55 10             	mov    %edx,0x10(%ebp)
  102ee8:	85 c0                	test   %eax,%eax
  102eea:	75 c3                	jne    102eaf <memcmp+0x14>
    }
    return 0;
  102eec:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102ef1:	c9                   	leave  
  102ef2:	c3                   	ret    

00102ef3 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102ef3:	55                   	push   %ebp
  102ef4:	89 e5                	mov    %esp,%ebp
  102ef6:	83 ec 38             	sub    $0x38,%esp
  102ef9:	8b 45 10             	mov    0x10(%ebp),%eax
  102efc:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102eff:	8b 45 14             	mov    0x14(%ebp),%eax
  102f02:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102f05:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102f08:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102f0b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102f0e:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102f11:	8b 45 18             	mov    0x18(%ebp),%eax
  102f14:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102f17:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102f1a:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102f1d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102f20:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102f23:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f26:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102f29:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102f2d:	74 1c                	je     102f4b <printnum+0x58>
  102f2f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f32:	ba 00 00 00 00       	mov    $0x0,%edx
  102f37:	f7 75 e4             	divl   -0x1c(%ebp)
  102f3a:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102f3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f40:	ba 00 00 00 00       	mov    $0x0,%edx
  102f45:	f7 75 e4             	divl   -0x1c(%ebp)
  102f48:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102f4b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102f4e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102f51:	f7 75 e4             	divl   -0x1c(%ebp)
  102f54:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102f57:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102f5a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102f5d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102f60:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102f63:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102f66:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102f69:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102f6c:	8b 45 18             	mov    0x18(%ebp),%eax
  102f6f:	ba 00 00 00 00       	mov    $0x0,%edx
  102f74:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102f77:	77 41                	ja     102fba <printnum+0xc7>
  102f79:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102f7c:	72 05                	jb     102f83 <printnum+0x90>
  102f7e:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  102f81:	77 37                	ja     102fba <printnum+0xc7>
        printnum(putch, putdat, result, base, width - 1, padc);
  102f83:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102f86:	83 e8 01             	sub    $0x1,%eax
  102f89:	83 ec 04             	sub    $0x4,%esp
  102f8c:	ff 75 20             	pushl  0x20(%ebp)
  102f8f:	50                   	push   %eax
  102f90:	ff 75 18             	pushl  0x18(%ebp)
  102f93:	ff 75 ec             	pushl  -0x14(%ebp)
  102f96:	ff 75 e8             	pushl  -0x18(%ebp)
  102f99:	ff 75 0c             	pushl  0xc(%ebp)
  102f9c:	ff 75 08             	pushl  0x8(%ebp)
  102f9f:	e8 4f ff ff ff       	call   102ef3 <printnum>
  102fa4:	83 c4 20             	add    $0x20,%esp
  102fa7:	eb 1b                	jmp    102fc4 <printnum+0xd1>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102fa9:	83 ec 08             	sub    $0x8,%esp
  102fac:	ff 75 0c             	pushl  0xc(%ebp)
  102faf:	ff 75 20             	pushl  0x20(%ebp)
  102fb2:	8b 45 08             	mov    0x8(%ebp),%eax
  102fb5:	ff d0                	call   *%eax
  102fb7:	83 c4 10             	add    $0x10,%esp
        while (-- width > 0)
  102fba:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  102fbe:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102fc2:	7f e5                	jg     102fa9 <printnum+0xb6>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102fc4:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102fc7:	05 d0 3c 10 00       	add    $0x103cd0,%eax
  102fcc:	0f b6 00             	movzbl (%eax),%eax
  102fcf:	0f be c0             	movsbl %al,%eax
  102fd2:	83 ec 08             	sub    $0x8,%esp
  102fd5:	ff 75 0c             	pushl  0xc(%ebp)
  102fd8:	50                   	push   %eax
  102fd9:	8b 45 08             	mov    0x8(%ebp),%eax
  102fdc:	ff d0                	call   *%eax
  102fde:	83 c4 10             	add    $0x10,%esp
}
  102fe1:	c9                   	leave  
  102fe2:	c3                   	ret    

00102fe3 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102fe3:	55                   	push   %ebp
  102fe4:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102fe6:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102fea:	7e 14                	jle    103000 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102fec:	8b 45 08             	mov    0x8(%ebp),%eax
  102fef:	8b 00                	mov    (%eax),%eax
  102ff1:	8d 48 08             	lea    0x8(%eax),%ecx
  102ff4:	8b 55 08             	mov    0x8(%ebp),%edx
  102ff7:	89 0a                	mov    %ecx,(%edx)
  102ff9:	8b 50 04             	mov    0x4(%eax),%edx
  102ffc:	8b 00                	mov    (%eax),%eax
  102ffe:	eb 30                	jmp    103030 <getuint+0x4d>
    }
    else if (lflag) {
  103000:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103004:	74 16                	je     10301c <getuint+0x39>
        return va_arg(*ap, unsigned long);
  103006:	8b 45 08             	mov    0x8(%ebp),%eax
  103009:	8b 00                	mov    (%eax),%eax
  10300b:	8d 48 04             	lea    0x4(%eax),%ecx
  10300e:	8b 55 08             	mov    0x8(%ebp),%edx
  103011:	89 0a                	mov    %ecx,(%edx)
  103013:	8b 00                	mov    (%eax),%eax
  103015:	ba 00 00 00 00       	mov    $0x0,%edx
  10301a:	eb 14                	jmp    103030 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  10301c:	8b 45 08             	mov    0x8(%ebp),%eax
  10301f:	8b 00                	mov    (%eax),%eax
  103021:	8d 48 04             	lea    0x4(%eax),%ecx
  103024:	8b 55 08             	mov    0x8(%ebp),%edx
  103027:	89 0a                	mov    %ecx,(%edx)
  103029:	8b 00                	mov    (%eax),%eax
  10302b:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  103030:	5d                   	pop    %ebp
  103031:	c3                   	ret    

00103032 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  103032:	55                   	push   %ebp
  103033:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  103035:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  103039:	7e 14                	jle    10304f <getint+0x1d>
        return va_arg(*ap, long long);
  10303b:	8b 45 08             	mov    0x8(%ebp),%eax
  10303e:	8b 00                	mov    (%eax),%eax
  103040:	8d 48 08             	lea    0x8(%eax),%ecx
  103043:	8b 55 08             	mov    0x8(%ebp),%edx
  103046:	89 0a                	mov    %ecx,(%edx)
  103048:	8b 50 04             	mov    0x4(%eax),%edx
  10304b:	8b 00                	mov    (%eax),%eax
  10304d:	eb 28                	jmp    103077 <getint+0x45>
    }
    else if (lflag) {
  10304f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103053:	74 12                	je     103067 <getint+0x35>
        return va_arg(*ap, long);
  103055:	8b 45 08             	mov    0x8(%ebp),%eax
  103058:	8b 00                	mov    (%eax),%eax
  10305a:	8d 48 04             	lea    0x4(%eax),%ecx
  10305d:	8b 55 08             	mov    0x8(%ebp),%edx
  103060:	89 0a                	mov    %ecx,(%edx)
  103062:	8b 00                	mov    (%eax),%eax
  103064:	99                   	cltd   
  103065:	eb 10                	jmp    103077 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  103067:	8b 45 08             	mov    0x8(%ebp),%eax
  10306a:	8b 00                	mov    (%eax),%eax
  10306c:	8d 48 04             	lea    0x4(%eax),%ecx
  10306f:	8b 55 08             	mov    0x8(%ebp),%edx
  103072:	89 0a                	mov    %ecx,(%edx)
  103074:	8b 00                	mov    (%eax),%eax
  103076:	99                   	cltd   
    }
}
  103077:	5d                   	pop    %ebp
  103078:	c3                   	ret    

00103079 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  103079:	55                   	push   %ebp
  10307a:	89 e5                	mov    %esp,%ebp
  10307c:	83 ec 18             	sub    $0x18,%esp
    va_list ap;

    va_start(ap, fmt);
  10307f:	8d 45 14             	lea    0x14(%ebp),%eax
  103082:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  103085:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103088:	50                   	push   %eax
  103089:	ff 75 10             	pushl  0x10(%ebp)
  10308c:	ff 75 0c             	pushl  0xc(%ebp)
  10308f:	ff 75 08             	pushl  0x8(%ebp)
  103092:	e8 05 00 00 00       	call   10309c <vprintfmt>
  103097:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  10309a:	c9                   	leave  
  10309b:	c3                   	ret    

0010309c <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  10309c:	55                   	push   %ebp
  10309d:	89 e5                	mov    %esp,%ebp
  10309f:	56                   	push   %esi
  1030a0:	53                   	push   %ebx
  1030a1:	83 ec 20             	sub    $0x20,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  1030a4:	eb 18                	jmp    1030be <vprintfmt+0x22>
            if (ch == '\0') {
  1030a6:	85 db                	test   %ebx,%ebx
  1030a8:	75 05                	jne    1030af <vprintfmt+0x13>
                return;
  1030aa:	e9 8b 03 00 00       	jmp    10343a <vprintfmt+0x39e>
            }
            putch(ch, putdat);
  1030af:	83 ec 08             	sub    $0x8,%esp
  1030b2:	ff 75 0c             	pushl  0xc(%ebp)
  1030b5:	53                   	push   %ebx
  1030b6:	8b 45 08             	mov    0x8(%ebp),%eax
  1030b9:	ff d0                	call   *%eax
  1030bb:	83 c4 10             	add    $0x10,%esp
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  1030be:	8b 45 10             	mov    0x10(%ebp),%eax
  1030c1:	8d 50 01             	lea    0x1(%eax),%edx
  1030c4:	89 55 10             	mov    %edx,0x10(%ebp)
  1030c7:	0f b6 00             	movzbl (%eax),%eax
  1030ca:	0f b6 d8             	movzbl %al,%ebx
  1030cd:	83 fb 25             	cmp    $0x25,%ebx
  1030d0:	75 d4                	jne    1030a6 <vprintfmt+0xa>
        }

        // Process a %-escape sequence
        char padc = ' ';
  1030d2:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  1030d6:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  1030dd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1030e0:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  1030e3:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  1030ea:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1030ed:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  1030f0:	8b 45 10             	mov    0x10(%ebp),%eax
  1030f3:	8d 50 01             	lea    0x1(%eax),%edx
  1030f6:	89 55 10             	mov    %edx,0x10(%ebp)
  1030f9:	0f b6 00             	movzbl (%eax),%eax
  1030fc:	0f b6 d8             	movzbl %al,%ebx
  1030ff:	8d 43 dd             	lea    -0x23(%ebx),%eax
  103102:	83 f8 55             	cmp    $0x55,%eax
  103105:	0f 87 02 03 00 00    	ja     10340d <vprintfmt+0x371>
  10310b:	8b 04 85 f4 3c 10 00 	mov    0x103cf4(,%eax,4),%eax
  103112:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  103114:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  103118:	eb d6                	jmp    1030f0 <vprintfmt+0x54>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  10311a:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  10311e:	eb d0                	jmp    1030f0 <vprintfmt+0x54>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  103120:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  103127:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10312a:	89 d0                	mov    %edx,%eax
  10312c:	c1 e0 02             	shl    $0x2,%eax
  10312f:	01 d0                	add    %edx,%eax
  103131:	01 c0                	add    %eax,%eax
  103133:	01 d8                	add    %ebx,%eax
  103135:	83 e8 30             	sub    $0x30,%eax
  103138:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  10313b:	8b 45 10             	mov    0x10(%ebp),%eax
  10313e:	0f b6 00             	movzbl (%eax),%eax
  103141:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  103144:	83 fb 2f             	cmp    $0x2f,%ebx
  103147:	7e 0b                	jle    103154 <vprintfmt+0xb8>
  103149:	83 fb 39             	cmp    $0x39,%ebx
  10314c:	7f 06                	jg     103154 <vprintfmt+0xb8>
            for (precision = 0; ; ++ fmt) {
  10314e:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                    break;
                }
            }
  103152:	eb d3                	jmp    103127 <vprintfmt+0x8b>
            goto process_precision;
  103154:	eb 2e                	jmp    103184 <vprintfmt+0xe8>

        case '*':
            precision = va_arg(ap, int);
  103156:	8b 45 14             	mov    0x14(%ebp),%eax
  103159:	8d 50 04             	lea    0x4(%eax),%edx
  10315c:	89 55 14             	mov    %edx,0x14(%ebp)
  10315f:	8b 00                	mov    (%eax),%eax
  103161:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  103164:	eb 1e                	jmp    103184 <vprintfmt+0xe8>

        case '.':
            if (width < 0)
  103166:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10316a:	79 07                	jns    103173 <vprintfmt+0xd7>
                width = 0;
  10316c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  103173:	e9 78 ff ff ff       	jmp    1030f0 <vprintfmt+0x54>

        case '#':
            altflag = 1;
  103178:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  10317f:	e9 6c ff ff ff       	jmp    1030f0 <vprintfmt+0x54>

        process_precision:
            if (width < 0)
  103184:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103188:	79 0d                	jns    103197 <vprintfmt+0xfb>
                width = precision, precision = -1;
  10318a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10318d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  103190:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  103197:	e9 54 ff ff ff       	jmp    1030f0 <vprintfmt+0x54>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  10319c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  1031a0:	e9 4b ff ff ff       	jmp    1030f0 <vprintfmt+0x54>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  1031a5:	8b 45 14             	mov    0x14(%ebp),%eax
  1031a8:	8d 50 04             	lea    0x4(%eax),%edx
  1031ab:	89 55 14             	mov    %edx,0x14(%ebp)
  1031ae:	8b 00                	mov    (%eax),%eax
  1031b0:	83 ec 08             	sub    $0x8,%esp
  1031b3:	ff 75 0c             	pushl  0xc(%ebp)
  1031b6:	50                   	push   %eax
  1031b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1031ba:	ff d0                	call   *%eax
  1031bc:	83 c4 10             	add    $0x10,%esp
            break;
  1031bf:	e9 71 02 00 00       	jmp    103435 <vprintfmt+0x399>

        // error message
        case 'e':
            err = va_arg(ap, int);
  1031c4:	8b 45 14             	mov    0x14(%ebp),%eax
  1031c7:	8d 50 04             	lea    0x4(%eax),%edx
  1031ca:	89 55 14             	mov    %edx,0x14(%ebp)
  1031cd:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  1031cf:	85 db                	test   %ebx,%ebx
  1031d1:	79 02                	jns    1031d5 <vprintfmt+0x139>
                err = -err;
  1031d3:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  1031d5:	83 fb 06             	cmp    $0x6,%ebx
  1031d8:	7f 0b                	jg     1031e5 <vprintfmt+0x149>
  1031da:	8b 34 9d b4 3c 10 00 	mov    0x103cb4(,%ebx,4),%esi
  1031e1:	85 f6                	test   %esi,%esi
  1031e3:	75 19                	jne    1031fe <vprintfmt+0x162>
                printfmt(putch, putdat, "error %d", err);
  1031e5:	53                   	push   %ebx
  1031e6:	68 e1 3c 10 00       	push   $0x103ce1
  1031eb:	ff 75 0c             	pushl  0xc(%ebp)
  1031ee:	ff 75 08             	pushl  0x8(%ebp)
  1031f1:	e8 83 fe ff ff       	call   103079 <printfmt>
  1031f6:	83 c4 10             	add    $0x10,%esp
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  1031f9:	e9 37 02 00 00       	jmp    103435 <vprintfmt+0x399>
                printfmt(putch, putdat, "%s", p);
  1031fe:	56                   	push   %esi
  1031ff:	68 ea 3c 10 00       	push   $0x103cea
  103204:	ff 75 0c             	pushl  0xc(%ebp)
  103207:	ff 75 08             	pushl  0x8(%ebp)
  10320a:	e8 6a fe ff ff       	call   103079 <printfmt>
  10320f:	83 c4 10             	add    $0x10,%esp
            break;
  103212:	e9 1e 02 00 00       	jmp    103435 <vprintfmt+0x399>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  103217:	8b 45 14             	mov    0x14(%ebp),%eax
  10321a:	8d 50 04             	lea    0x4(%eax),%edx
  10321d:	89 55 14             	mov    %edx,0x14(%ebp)
  103220:	8b 30                	mov    (%eax),%esi
  103222:	85 f6                	test   %esi,%esi
  103224:	75 05                	jne    10322b <vprintfmt+0x18f>
                p = "(null)";
  103226:	be ed 3c 10 00       	mov    $0x103ced,%esi
            }
            if (width > 0 && padc != '-') {
  10322b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10322f:	7e 3f                	jle    103270 <vprintfmt+0x1d4>
  103231:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  103235:	74 39                	je     103270 <vprintfmt+0x1d4>
                for (width -= strnlen(p, precision); width > 0; width --) {
  103237:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10323a:	83 ec 08             	sub    $0x8,%esp
  10323d:	50                   	push   %eax
  10323e:	56                   	push   %esi
  10323f:	e8 1b f8 ff ff       	call   102a5f <strnlen>
  103244:	83 c4 10             	add    $0x10,%esp
  103247:	89 c2                	mov    %eax,%edx
  103249:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10324c:	29 d0                	sub    %edx,%eax
  10324e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  103251:	eb 17                	jmp    10326a <vprintfmt+0x1ce>
                    putch(padc, putdat);
  103253:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  103257:	83 ec 08             	sub    $0x8,%esp
  10325a:	ff 75 0c             	pushl  0xc(%ebp)
  10325d:	50                   	push   %eax
  10325e:	8b 45 08             	mov    0x8(%ebp),%eax
  103261:	ff d0                	call   *%eax
  103263:	83 c4 10             	add    $0x10,%esp
                for (width -= strnlen(p, precision); width > 0; width --) {
  103266:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  10326a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10326e:	7f e3                	jg     103253 <vprintfmt+0x1b7>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  103270:	eb 35                	jmp    1032a7 <vprintfmt+0x20b>
                if (altflag && (ch < ' ' || ch > '~')) {
  103272:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  103276:	74 1c                	je     103294 <vprintfmt+0x1f8>
  103278:	83 fb 1f             	cmp    $0x1f,%ebx
  10327b:	7e 05                	jle    103282 <vprintfmt+0x1e6>
  10327d:	83 fb 7e             	cmp    $0x7e,%ebx
  103280:	7e 12                	jle    103294 <vprintfmt+0x1f8>
                    putch('?', putdat);
  103282:	83 ec 08             	sub    $0x8,%esp
  103285:	ff 75 0c             	pushl  0xc(%ebp)
  103288:	6a 3f                	push   $0x3f
  10328a:	8b 45 08             	mov    0x8(%ebp),%eax
  10328d:	ff d0                	call   *%eax
  10328f:	83 c4 10             	add    $0x10,%esp
  103292:	eb 0f                	jmp    1032a3 <vprintfmt+0x207>
                }
                else {
                    putch(ch, putdat);
  103294:	83 ec 08             	sub    $0x8,%esp
  103297:	ff 75 0c             	pushl  0xc(%ebp)
  10329a:	53                   	push   %ebx
  10329b:	8b 45 08             	mov    0x8(%ebp),%eax
  10329e:	ff d0                	call   *%eax
  1032a0:	83 c4 10             	add    $0x10,%esp
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  1032a3:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  1032a7:	89 f0                	mov    %esi,%eax
  1032a9:	8d 70 01             	lea    0x1(%eax),%esi
  1032ac:	0f b6 00             	movzbl (%eax),%eax
  1032af:	0f be d8             	movsbl %al,%ebx
  1032b2:	85 db                	test   %ebx,%ebx
  1032b4:	74 10                	je     1032c6 <vprintfmt+0x22a>
  1032b6:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  1032ba:	78 b6                	js     103272 <vprintfmt+0x1d6>
  1032bc:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  1032c0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  1032c4:	79 ac                	jns    103272 <vprintfmt+0x1d6>
                }
            }
            for (; width > 0; width --) {
  1032c6:	eb 14                	jmp    1032dc <vprintfmt+0x240>
                putch(' ', putdat);
  1032c8:	83 ec 08             	sub    $0x8,%esp
  1032cb:	ff 75 0c             	pushl  0xc(%ebp)
  1032ce:	6a 20                	push   $0x20
  1032d0:	8b 45 08             	mov    0x8(%ebp),%eax
  1032d3:	ff d0                	call   *%eax
  1032d5:	83 c4 10             	add    $0x10,%esp
            for (; width > 0; width --) {
  1032d8:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  1032dc:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1032e0:	7f e6                	jg     1032c8 <vprintfmt+0x22c>
            }
            break;
  1032e2:	e9 4e 01 00 00       	jmp    103435 <vprintfmt+0x399>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  1032e7:	83 ec 08             	sub    $0x8,%esp
  1032ea:	ff 75 e0             	pushl  -0x20(%ebp)
  1032ed:	8d 45 14             	lea    0x14(%ebp),%eax
  1032f0:	50                   	push   %eax
  1032f1:	e8 3c fd ff ff       	call   103032 <getint>
  1032f6:	83 c4 10             	add    $0x10,%esp
  1032f9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1032fc:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  1032ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103302:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103305:	85 d2                	test   %edx,%edx
  103307:	79 23                	jns    10332c <vprintfmt+0x290>
                putch('-', putdat);
  103309:	83 ec 08             	sub    $0x8,%esp
  10330c:	ff 75 0c             	pushl  0xc(%ebp)
  10330f:	6a 2d                	push   $0x2d
  103311:	8b 45 08             	mov    0x8(%ebp),%eax
  103314:	ff d0                	call   *%eax
  103316:	83 c4 10             	add    $0x10,%esp
                num = -(long long)num;
  103319:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10331c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10331f:	f7 d8                	neg    %eax
  103321:	83 d2 00             	adc    $0x0,%edx
  103324:	f7 da                	neg    %edx
  103326:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103329:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  10332c:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  103333:	e9 9f 00 00 00       	jmp    1033d7 <vprintfmt+0x33b>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  103338:	83 ec 08             	sub    $0x8,%esp
  10333b:	ff 75 e0             	pushl  -0x20(%ebp)
  10333e:	8d 45 14             	lea    0x14(%ebp),%eax
  103341:	50                   	push   %eax
  103342:	e8 9c fc ff ff       	call   102fe3 <getuint>
  103347:	83 c4 10             	add    $0x10,%esp
  10334a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10334d:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  103350:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  103357:	eb 7e                	jmp    1033d7 <vprintfmt+0x33b>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  103359:	83 ec 08             	sub    $0x8,%esp
  10335c:	ff 75 e0             	pushl  -0x20(%ebp)
  10335f:	8d 45 14             	lea    0x14(%ebp),%eax
  103362:	50                   	push   %eax
  103363:	e8 7b fc ff ff       	call   102fe3 <getuint>
  103368:	83 c4 10             	add    $0x10,%esp
  10336b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10336e:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  103371:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  103378:	eb 5d                	jmp    1033d7 <vprintfmt+0x33b>

        // pointer
        case 'p':
            putch('0', putdat);
  10337a:	83 ec 08             	sub    $0x8,%esp
  10337d:	ff 75 0c             	pushl  0xc(%ebp)
  103380:	6a 30                	push   $0x30
  103382:	8b 45 08             	mov    0x8(%ebp),%eax
  103385:	ff d0                	call   *%eax
  103387:	83 c4 10             	add    $0x10,%esp
            putch('x', putdat);
  10338a:	83 ec 08             	sub    $0x8,%esp
  10338d:	ff 75 0c             	pushl  0xc(%ebp)
  103390:	6a 78                	push   $0x78
  103392:	8b 45 08             	mov    0x8(%ebp),%eax
  103395:	ff d0                	call   *%eax
  103397:	83 c4 10             	add    $0x10,%esp
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  10339a:	8b 45 14             	mov    0x14(%ebp),%eax
  10339d:	8d 50 04             	lea    0x4(%eax),%edx
  1033a0:	89 55 14             	mov    %edx,0x14(%ebp)
  1033a3:	8b 00                	mov    (%eax),%eax
  1033a5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033a8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  1033af:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  1033b6:	eb 1f                	jmp    1033d7 <vprintfmt+0x33b>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  1033b8:	83 ec 08             	sub    $0x8,%esp
  1033bb:	ff 75 e0             	pushl  -0x20(%ebp)
  1033be:	8d 45 14             	lea    0x14(%ebp),%eax
  1033c1:	50                   	push   %eax
  1033c2:	e8 1c fc ff ff       	call   102fe3 <getuint>
  1033c7:	83 c4 10             	add    $0x10,%esp
  1033ca:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033cd:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  1033d0:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  1033d7:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  1033db:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1033de:	83 ec 04             	sub    $0x4,%esp
  1033e1:	52                   	push   %edx
  1033e2:	ff 75 e8             	pushl  -0x18(%ebp)
  1033e5:	50                   	push   %eax
  1033e6:	ff 75 f4             	pushl  -0xc(%ebp)
  1033e9:	ff 75 f0             	pushl  -0x10(%ebp)
  1033ec:	ff 75 0c             	pushl  0xc(%ebp)
  1033ef:	ff 75 08             	pushl  0x8(%ebp)
  1033f2:	e8 fc fa ff ff       	call   102ef3 <printnum>
  1033f7:	83 c4 20             	add    $0x20,%esp
            break;
  1033fa:	eb 39                	jmp    103435 <vprintfmt+0x399>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  1033fc:	83 ec 08             	sub    $0x8,%esp
  1033ff:	ff 75 0c             	pushl  0xc(%ebp)
  103402:	53                   	push   %ebx
  103403:	8b 45 08             	mov    0x8(%ebp),%eax
  103406:	ff d0                	call   *%eax
  103408:	83 c4 10             	add    $0x10,%esp
            break;
  10340b:	eb 28                	jmp    103435 <vprintfmt+0x399>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  10340d:	83 ec 08             	sub    $0x8,%esp
  103410:	ff 75 0c             	pushl  0xc(%ebp)
  103413:	6a 25                	push   $0x25
  103415:	8b 45 08             	mov    0x8(%ebp),%eax
  103418:	ff d0                	call   *%eax
  10341a:	83 c4 10             	add    $0x10,%esp
            for (fmt --; fmt[-1] != '%'; fmt --)
  10341d:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103421:	eb 04                	jmp    103427 <vprintfmt+0x38b>
  103423:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103427:	8b 45 10             	mov    0x10(%ebp),%eax
  10342a:	83 e8 01             	sub    $0x1,%eax
  10342d:	0f b6 00             	movzbl (%eax),%eax
  103430:	3c 25                	cmp    $0x25,%al
  103432:	75 ef                	jne    103423 <vprintfmt+0x387>
                /* do nothing */;
            break;
  103434:	90                   	nop
        }
    }
  103435:	e9 6a fc ff ff       	jmp    1030a4 <vprintfmt+0x8>
}
  10343a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10343d:	5b                   	pop    %ebx
  10343e:	5e                   	pop    %esi
  10343f:	5d                   	pop    %ebp
  103440:	c3                   	ret    

00103441 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  103441:	55                   	push   %ebp
  103442:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  103444:	8b 45 0c             	mov    0xc(%ebp),%eax
  103447:	8b 40 08             	mov    0x8(%eax),%eax
  10344a:	8d 50 01             	lea    0x1(%eax),%edx
  10344d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103450:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  103453:	8b 45 0c             	mov    0xc(%ebp),%eax
  103456:	8b 10                	mov    (%eax),%edx
  103458:	8b 45 0c             	mov    0xc(%ebp),%eax
  10345b:	8b 40 04             	mov    0x4(%eax),%eax
  10345e:	39 c2                	cmp    %eax,%edx
  103460:	73 12                	jae    103474 <sprintputch+0x33>
        *b->buf ++ = ch;
  103462:	8b 45 0c             	mov    0xc(%ebp),%eax
  103465:	8b 00                	mov    (%eax),%eax
  103467:	8d 48 01             	lea    0x1(%eax),%ecx
  10346a:	8b 55 0c             	mov    0xc(%ebp),%edx
  10346d:	89 0a                	mov    %ecx,(%edx)
  10346f:	8b 55 08             	mov    0x8(%ebp),%edx
  103472:	88 10                	mov    %dl,(%eax)
    }
}
  103474:	5d                   	pop    %ebp
  103475:	c3                   	ret    

00103476 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  103476:	55                   	push   %ebp
  103477:	89 e5                	mov    %esp,%ebp
  103479:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10347c:	8d 45 14             	lea    0x14(%ebp),%eax
  10347f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  103482:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103485:	50                   	push   %eax
  103486:	ff 75 10             	pushl  0x10(%ebp)
  103489:	ff 75 0c             	pushl  0xc(%ebp)
  10348c:	ff 75 08             	pushl  0x8(%ebp)
  10348f:	e8 0b 00 00 00       	call   10349f <vsnprintf>
  103494:	83 c4 10             	add    $0x10,%esp
  103497:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10349a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10349d:	c9                   	leave  
  10349e:	c3                   	ret    

0010349f <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  10349f:	55                   	push   %ebp
  1034a0:	89 e5                	mov    %esp,%ebp
  1034a2:	83 ec 18             	sub    $0x18,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  1034a5:	8b 45 08             	mov    0x8(%ebp),%eax
  1034a8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1034ab:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034ae:	8d 50 ff             	lea    -0x1(%eax),%edx
  1034b1:	8b 45 08             	mov    0x8(%ebp),%eax
  1034b4:	01 d0                	add    %edx,%eax
  1034b6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1034b9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  1034c0:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1034c4:	74 0a                	je     1034d0 <vsnprintf+0x31>
  1034c6:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1034c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1034cc:	39 c2                	cmp    %eax,%edx
  1034ce:	76 07                	jbe    1034d7 <vsnprintf+0x38>
        return -E_INVAL;
  1034d0:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  1034d5:	eb 20                	jmp    1034f7 <vsnprintf+0x58>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  1034d7:	ff 75 14             	pushl  0x14(%ebp)
  1034da:	ff 75 10             	pushl  0x10(%ebp)
  1034dd:	8d 45 ec             	lea    -0x14(%ebp),%eax
  1034e0:	50                   	push   %eax
  1034e1:	68 41 34 10 00       	push   $0x103441
  1034e6:	e8 b1 fb ff ff       	call   10309c <vprintfmt>
  1034eb:	83 c4 10             	add    $0x10,%esp
    // null terminate the buffer
    *b.buf = '\0';
  1034ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1034f1:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  1034f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1034f7:	c9                   	leave  
  1034f8:	c3                   	ret    
