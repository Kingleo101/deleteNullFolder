package demo1;

import java.util.Scanner;

/*
 * 15、(挑战题 选做)控制台输入两个整数 n,m
例如： n=4, m=3 ,则打印出 4+44+444 的结果
n=8, m=5,则打印出 8+88+888+8888+88888的结果	
*/
public class Demo2 {
	public static void main(String[] args) {
		
		double sum = 0;
		Scanner sca = new Scanner(System.in);
		System.out.println("请输入i:");
		int i = sca.nextInt();
		Scanner sca1 = new Scanner(System.in);
		System.out.println("请输入j:");
		int j = sca1.nextInt();
		int m = j;
		double ma = Math.pow(10, 0)*i;
		System.out.println(ma);
		while(m<j) {
			if(m==0) {
				sum += Math.pow(10, m)*i;
				System.out.println(sum);
				m++;
			}else {
				sum += (Math.pow(10, m)+Math.pow(10, m-1))*i;
				System.out.println(sum);
				m++;
			}
			
			i++;
			
		}
		System.out.println(sum);
	}
}
/*
 * 第一次 10的0次方*1
 
 * 
 * 
 */