/**
 * 
 */
package com.stars.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

/**
 * @author Administrator
 *  复制文件到指定文件夹
 */
public class CopyFiles {

	
	
 
	public CopyFiles(String fromPathStr, String toPathStr) {
		
		  //获取源文件的名称
        String newFileName = fromPathStr.substring(fromPathStr.lastIndexOf("\\")+1); //目标文件地址
        System.out.println("源文件:"+newFileName);
        toPathStr = toPathStr + File.separator + newFileName; //源文件地址
        System.out.println("目标文件地址:"+toPathStr);
        try
		{
             FileInputStream fis = new FileInputStream(fromPathStr);//创建输入流对象
             FileOutputStream fos = new FileOutputStream(toPathStr); //创建输出流对象               
             byte datas[] = new byte[1024*8];//创建搬运工具
             int len = 0;//创建长度   
             while((len = fis.read(datas))!=-1)//循环读取数据
			{
				fos.write(datas,0,len);
            } 
                fis.close();//释放资源
                fis.close();//释放资源
        }
			catch (Exception e)
			{
                e.printStackTrace();
            }

	}
	
	
}
