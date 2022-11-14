package com.mentor.mentee;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class Test {
	
	public static void main(String[] args) {
		Map<String,String> map = new HashMap<>();
		map.put("a","1");
		map.put("b","1");
		map.put("c","1");
		map.put("d","1");
		Iterator<String> it = map.keySet().iterator();
		while(it.hasNext()) {
			String key = it.next();
			System.out.println("key : " + key + ", value : " + map.get(key));
		}
	}
}
