.data
string1: .asciiz "Enter your a \n"
string2: .asciiz "Enter your a \n"
string3: .asciiz "Enter your a \n"
error: .asciiz "Complex roots \n"
string4: .asciiz "Your roots are "
string5: .asciiz " and "
num1: .float 4
num2: .float 2
num4: .float 0
.text
l.s $f1,num1 # 4 = $f1
l.s $f2,num2 # 2 = $f2
l.s $f10,num4 # 0 = $f10
# a = $f3
li $v0,4
la $a0,string1
syscall
li $v0,6
syscall
add.s $f3,$f0,$f10
# b = $f4
li $v0,4
la $a0,string2
syscall
li $v0,6
syscall
add.s $f4,$f0,$f10
# c = $f5
li $v0,4
la $a0,string3
syscall
li $v0,6
syscall
add.s $f5,$f0,$f10
#b^2 = $f6
mul.s $f6,$f4,$f4
#2a = $f2
mul.s $f2,$f2,$f3
#ac = $f7
mul.s $f7,$f3,$f5
#4ac = $f1
mul.s $f1,$f1,$f7
#d(b^2-4ac) = $f7
sub.s $f7,$f6,$f1
#check d condition
mfc1 $t1,$f7
blez $t1,complex_error
#x1 = $f8
sqrt.s $f7,$f7 #sqrt(d) = $f7
neg.s $f4,$f4  #-b = $f4
add.s $f8,$f4,$f7
div.s $f8,$f8,$f2
#x2 = $f9
sub.s $f9,$f4,$f7
div.s $f9,$f9,$f2
#output answer
li $v0,4
la $a0,string4
syscall
li $v0,2
mov.s $f12,$f8
syscall
li $v0,4
la $a0,string5
syscall
li $v0,2
mov.s $f12,$f9
syscall
b exit
complex_error:
li $v0,4
la $a0,error
syscall
exit:
li $v0,10
syscall



