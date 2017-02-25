package net.study.resume.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import net.study.resume.annotation.constraints.MinLowerCharCount;

public class MinLowerCharCountConstraintValidator implements ConstraintValidator<MinLowerCharCount, String> {

	private static final String LETTERS = "abcdefghigklmnopqrstuvwxyz";

	private int count;

	@Override
	public void initialize(MinLowerCharCount constraintAnnotation) {
		this.count = constraintAnnotation.value();
	}

	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		if (value == null) {
			return true;
		}
		int countLetters = 0;
		for (int i = 0; i < value.length(); i++) {
			char ch = value.charAt(i);
			if (LETTERS.indexOf(ch) != -1) {
				countLetters++;
			}
		}
		if (countLetters >= count) {
			return true;
		} else {
			return false;
		}
	}
}
