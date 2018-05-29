package demo1;

import java.util.Scanner;

public class Demo1 {

	public static void main(String[] args) {
		int i = 1, sum=0, j=100, n=200 , add=0 ,avg=0 ,y=1 ,sum1=0;
		
		while(i<=100){
			
//			1、循环100次说“我爱写程序”
			System.out.println("100次我爱写程序");
			
//			2、循环输出1到100之间的所有数。
			System.out.println("1到100之间的所有数"+i);
//			3、循环输出1到100之间的所有偶数。
			if(i%2==0){
				System.out.println("1到100之间的所有偶数"+i);
			}
//			4、循环输出10到100之间所有能被5整除的数。
			if(i>=10&&i<=100&&i%5==0){
				System.out.println("10到100之间所有能被5整除的数"+i);
			}
//			6. 计算1+3+5+7.......+99的和
			if(i%2!=0){
//			10.计算1+3+5+。。。。。。当加到他的和是500时 ，求最后加的那个数(注意i的改变和sum=sum+i的位置)
				if(sum==500){
					System.out.println("1+3+5+。。。。。。当加到他的和是500时 ，求最后加的那个数"+i);
				}
				sum+=i;
				

			}
//			计算1+2+3+4+……+100的结果。
			add+=i;
			
			
			
			i++;
		}
		
//		5、循环输出100到200之间所有能被2和3整除  的数。
		while(j<=200){
			if(j%2==0&&j%3==0){
				System.out.println("100到200之间所有能被2和3整除  的数"+j);
			}
			j++;
		}
//		7、循环输出200到1000之间，只要能被5整除，或则能被8整除的数。
		while(n<=1000){
			if(n%5==0||n%8==0){
				System.out.println("输出200到1000之间，只要能被5整除，或则能被8整除的数"+n);
			}
			n++;
		}
		
//		9、计算1*2*3*……*10的结果。	
		while(i<=10){
			avg=avg*i;
			
		}
		System.out.println("1*2*3*……*10的结果"+avg);
//		11、输入一个整数，记录在变量m中，  计算1+2+……+m的结果。
		System.out.println("请输入一个整数"+y);
		Scanner x = new Scanner(System.in);
		int m = x.nextInt();
		

		while(y<=m){
			sum1=sum1+y;
			
			y++;
		}
		System.out.println("输入一个整数，记录在变量m中，  计算1+2+……+m的结果。"+sum1);
		System.out.println("1+2+3+4+……+100的结果"+add);
		System.out.println("1+3+5+7.......+99的和"+sum);
//		12、循环输入10个整数，统计这10个整数中有多少个偶数。
		Scanner a = new Scanner(System.in);
		
		int c=1;
		int zheng = 0;
		while(c<=10){
			System.out.println("输入一个整数");
			int b = a.nextInt();
			if(b%2==0){
				zheng++;
				
			}
			c++;
		}
		System.out.println("共有"+zheng+"个偶数");
//		13、一球从100米高度自由落下，每次落地后反跳回原高度的一半；再落下
//		，求它在第10次落地时，打印出共经过多少米？打印出第10次反弹多高？
		double height = 100;
		double sum2 =0 , tan = 0;
		int ci = 1;
		while(ci<10){
			sum2=sum2+height;
			height=height/2;
			sum2=height+sum2;
			ci++;
			
		}
		System.out.println("共经过多少米"+sum2);
		System.out.println(height);

//			14、输出10000-99999里面的所有回文数。
//			提示：即12321是回文数，个位与万位相同，十位与千位相同。
			

		
	}
	
}
