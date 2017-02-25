package net.study.resume.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import net.study.resume.annotation.constraints.Phone;

public class PhoneConstraintValidator implements ConstraintValidator<Phone, String>{

	private boolean withSpechSymbol;
	
	@Override
	public void initialize(Phone constraintAnnotation) {
		this.withSpechSymbol = constraintAnnotation.withSpechSymbol();
		
	}

	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		if(value == null){
			return true;
		}
		if(value.startsWith(SPECH_SYMBOL)) {
			String validationTemplate = getValidationTemplate();
			for(int i=0; i<value.length(); i++) {
				char ch = value.charAt(i);
				if(validationTemplate.indexOf(ch) == -1) {
					return false;
				}
			}
			return true;
		}
		return false;
	}

	private static final String NUMBERS = "0123456789";
	private static final String SPECH_SYMBOL = "+";
	
	private String getValidationTemplate() {
		StringBuilder template = new StringBuilder(NUMBERS);
		if(withSpechSymbol) {
			template.append(SPECH_SYMBOL);;
		}
		return template.toString();
	}
}
