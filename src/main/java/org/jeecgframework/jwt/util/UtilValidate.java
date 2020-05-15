package org.jeecgframework.jwt.util;

import java.util.Arrays;
import java.util.Collection;
import java.util.Map;

/**
 * 验证工具类，常用方法的验证
 *
 * @author Yan Jingchao
 */
public class UtilValidate {

    public static boolean isEmpty(Object o) {
        return ObjectType.isEmpty(o);
    }

    public static boolean isNotEmpty(Object o) {
        return !ObjectType.isEmpty(o);
    }

    public static boolean isEmpty(String s) {
        return ((s == null) || (s.length() == 0));
    }

    public static <E> boolean isEmpty(Collection<E> c) {
        return ((c == null) || (c.size() == 0));
    }

    public static <K, E> boolean isEmpty(Map<K, E> m) {
        return ((m == null) || (m.size() == 0));
    }

    public static <E> boolean isEmpty(CharSequence c) {
        return ((c == null) || (c.length() == 0));
    }

    public static boolean isNotEmpty(String s) {
        return ((s != null) && (s.trim().length() > 0));
    }

    public static <E> boolean isNotEmpty(Collection<E> c) {
        return ((c != null) && (c.size() > 0));
    }

    public static <E> boolean isNotEmpty(CharSequence c) {
        return ((c != null) && (c.length() > 0));
    }
    
    public static <T> T[] concatAll(T[] first, T[]... rest) {
    	 int totalLength = first.length;
    	 for (T[] array : rest) {
    	  totalLength += array.length;
    	 }
    	 T[] result = Arrays.copyOf(first, totalLength);
    	 int offset = first.length;
    	 for (T[] array : rest) {
    	  System.arraycopy(array, 0, result, offset, array.length);
    	  offset += array.length;
    	 }
    	 return result;
    }
}
