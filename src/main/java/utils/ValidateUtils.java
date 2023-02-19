package utils;

import java.util.regex.Pattern;

public class ValidateUtils {
//    public static final String ADDRESS_REGEX = "^[A-Za-z0-9][A-Za-z0-9\\s]{8,15}$";
//    public static final String ADDRESS_REGEX = "^[A-Za-z0-9][A-Za-z0-9\\s]{1,3}$";
    public static final String NAME_REGEX = "^[A-Za-z0-9][A-Za-z0-9\\s]{8,15}$";
//    public static final String NAME_REGEX = "^[A-Za-z0-9][A-Za-z0-9\\s]{1,3}$";
    public static final String EMAIL_REGEX = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}$";
    //a@b.cd
    public static final String PASSWORD_PATTERN = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$";
    //Password chứa ít nhất 8 ký tự, bao gồm cả chữ và số, bắt đầu bằng chữ cái hoa
    public static final String ADDRESS_PATTERN = "^[A-Za-z0-9][A-Za-z0-9\\s]{2,}$";
    //Địa chỉ k chứa ký tự đặc biệt, NTP hoặc 28 NTP

    public static boolean isNameValid(String name) {
        return Pattern.matches(NAME_REGEX, name);
    }

    public static boolean isEmailValid(String email){
        return Pattern.matches(EMAIL_REGEX, email);
    }

    public static boolean isPasswordValid(String password){
        return Pattern.matches(PASSWORD_PATTERN, password);
    }

    public static boolean isAddressValid(String address) {
        return Pattern.matches(ADDRESS_PATTERN, address);
    }

}
