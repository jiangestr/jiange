package com.jiange.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			String snn = URLEncoder.encode("ÖÐ¹ú", "utf-8");
			System.out.println(snn);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
