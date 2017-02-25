package net.study.resume.validator;

import java.util.Date;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.joda.time.LocalDate;
import org.joda.time.Years;

import net.study.resume.annotation.constraints.Adulthood;

public class AdulthoodConstraintValidator implements ConstraintValidator<Adulthood, Date>{

	int adulthoodAge;
	
	@Override
	public void initialize(Adulthood constraintAnnotation) {
		this.adulthoodAge = constraintAnnotation.adulthoodAge();
	}

	@Override
	public boolean isValid(Date value, ConstraintValidatorContext context) {		
		if (value == null) {
			return true;
		}
		try {
			LocalDate date = new LocalDate(value);
			LocalDate today = new LocalDate();
			int years = Years.yearsBetween(date, today).getYears();
			return years >= adulthoodAge;
		} catch (Exception e) {
			return false;
		}
	}
}
