package demo1;

import java.util.Scanner;

/*
 * 15��(��ս�� ѡ��)����̨������������ n,m
���磺 n=4, m=3 ,���ӡ�� 4+44+444 �Ľ��
n=8, m=5,���ӡ�� 8+88+888+8888+88888�Ľ��	
*/
public class Demo2 {
	public static void main(String[] args) {
		
		double sum = 0;
		Scanner sca = new Scanner(System.in);
		System.out.println("������i:");
		int i = sca.nextInt();
		Scanner sca1 = new Scanner(System.in);
		System.out.println("������j:");
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
 * ��һ�� 10��0�η�*1
 
 * 
 * 
 */