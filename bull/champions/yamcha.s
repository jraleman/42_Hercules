;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    yamcha.s                                           :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2017/03/31 15:13:49 by jaleman           #+#    #+#              ;
;    Updated: 2017/03/31 15:14:03 by jaleman          ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

.name		"Yamcha"
.comment	"I don't know who is this, but it sounds disappointing. 凸(｀⌒´メ)凸"

entry:
	fork %:spawn		; [0x0c] create a new process that will inherit the
						; different states of its father.

main:
	sti r1, %:live, %1	; [0x0b] add the result of the two indexes passed as
						; arguments to the value of the register r1.
	and r1, %0, r1		; [0x06] restore the result of r1 & %0 to register r1,
						; modifying the carry flag.

live:
	live %1				; [0x01] allows a process to stay alive.
	zjmp %:live			; [0x09] takes index live and jump to this address if
						; the carry is 1.

spawn:
	live %1				; [0x01] allows a process to stay alive.
