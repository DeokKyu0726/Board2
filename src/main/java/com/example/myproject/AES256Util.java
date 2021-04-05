package com.example.myproject;

import org.apache.commons.codec.binary.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;

public class AES256Util {

  private String key;
  private String iv;
  private Key keySpec;

  public AES256Util() {
  }

  public AES256Util(String secret) throws UnsupportedEncodingException {
    this.key = secret;

    this.iv = secret.substring(0, 16);
    byte[] keyBytes = new byte[16];
    byte[] b = secret.getBytes("UTF-8");
    int len = b.length;
    if (len > keyBytes.length) {
      len = keyBytes.length;
    }

    System.arraycopy(b, 0, keyBytes, 0, len);
    SecretKeySpec keySpec = new SecretKeySpec(keyBytes, "AES");

    this.keySpec = keySpec;
  }

  public String encrypt(String str) throws NoSuchPaddingException,
          NoSuchAlgorithmException, InvalidAlgorithmParameterException,
          InvalidKeyException, UnsupportedEncodingException,
          BadPaddingException, IllegalBlockSizeException {
    Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
    c.init(Cipher.ENCRYPT_MODE, this.keySpec, new IvParameterSpec(iv.getBytes()));
    byte[] encrypted = c.doFinal(str.getBytes("UTF-8"));
    String enStr = new String(Base64.encodeBase64(encrypted));
    return enStr;
  }

  public String decrypt(String str) throws NoSuchPaddingException,
          NoSuchAlgorithmException, InvalidAlgorithmParameterException,
          InvalidKeyException, BadPaddingException, IllegalBlockSizeException,
          UnsupportedEncodingException {
    try {
      Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
      c.init(Cipher.DECRYPT_MODE, this.keySpec, new IvParameterSpec(iv.getBytes()));
      byte[] byteStr = Base64.decodeBase64(str.getBytes());
      return new String(c.doFinal(byteStr), "UTF-8");
    } catch (Exception e) {
      int i = 0;
    }

    return null;
  }
}
