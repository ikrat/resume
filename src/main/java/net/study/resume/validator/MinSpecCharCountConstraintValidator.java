package net.study.resume.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import net.study.resume.annotation.constraints.MinSpecCharCount;

public class MinSpecCharCountConstraintValidator implements ConstraintValidator<MinSpecCharCount, String>{

	private String symbols;
	
	private int count;
	
	@Override
	public void initialize(MinSpecCharCount constraintAnnotation) {
		this.count = constraintAnnotation.value();
		this.symbols = constraintAnnotation.specSymbols();
		
	}

	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		if(value == null) {
			return true;
		}
		int countSymbols = 0;
		for (int i=0; i<value.length(); i++) {
			char ch = value.charAt(i);
			if(symbols.indexOf(ch) != -1) {
				countSymbols++;
			}
		}
		if(countSymbols >= count) {
			return true;
		} else {
			return false;
		}
	}
}