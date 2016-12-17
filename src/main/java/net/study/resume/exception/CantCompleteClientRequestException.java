package net.study.resume.exception;

public class CantCompleteClientRequestException extends RuntimeException {
	private static final long serialVersionUID = -2402280519063191771L;

	public CantCompleteClientRequestException(String message) {
		super(message);
	}

	public CantCompleteClientRequestException(Throwable cause) {
		super(cause);
	}

	public CantCompleteClientRequestException(String message, Throwable cause) {
		super(message, cause);
	}
}
