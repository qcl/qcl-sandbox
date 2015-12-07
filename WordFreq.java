package tw.qcl.nlp.utils;

import java.util.*;

public class WordFreq {
    public static void main(String[] argv) {
        System.out.println("Hello world");
        WordFreq.getAllSubStrings("中文測試一下嘛", 3);
    }

    public static List<String> getAllSubStrings(String str, int maxLength) {
        System.out.println(str);
        System.out.println(maxLength);
        
        List<String> result = new ArrayList<String>();
        int i = Math.min(str.length(), maxLength);
        do {
            result.add(str.substring(0, i));
            i--;
        } while ( i > 1);

        return null;
    }
}
