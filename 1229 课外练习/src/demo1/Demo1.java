package demo1;

import java.util.Scanner;

public class Demo1 {

	public static void main(String[] args) {
		int i = 1, sum=0, j=100, n=200 , add=0 ,avg=0 ,y=1 ,sum1=0;
		
		while(i<=100){
			
//			1��ѭ��100��˵���Ұ�д����
			System.out.println("100���Ұ�д����");
			
//			2��ѭ�����1��100֮�����������
			System.out.println("1��100֮���������"+i);
//			3��ѭ�����1��100֮�������ż����
			if(i%2==0){
				System.out.println("1��100֮�������ż��"+i);
			}
//			4��ѭ�����10��100֮�������ܱ�5����������
			if(i>=10&&i<=100&&i%5==0){
				System.out.println("10��100֮�������ܱ�5��������"+i);
			}
//			6. ����1+3+5+7.......+99�ĺ�
			if(i%2!=0){
//			10.����1+3+5+���������������ӵ����ĺ���500ʱ �������ӵ��Ǹ���(ע��i�ĸı��sum=sum+i��λ��)
				if(sum==500){
					System.out.println("1+3+5+���������������ӵ����ĺ���500ʱ �������ӵ��Ǹ���"+i);
				}
				sum+=i;
				

			}
//			����1+2+3+4+����+100�Ľ����
			add+=i;
			
			
			
			i++;
		}
		
//		5��ѭ�����100��200֮�������ܱ�2��3����  ������
		while(j<=200){
			if(j%2==0&&j%3==0){
				System.out.println("100��200֮�������ܱ�2��3����  ����"+j);
			}
			j++;
		}
//		7��ѭ�����200��1000֮�䣬ֻҪ�ܱ�5�����������ܱ�8����������
		while(n<=1000){
			if(n%5==0||n%8==0){
				System.out.println("���200��1000֮�䣬ֻҪ�ܱ�5�����������ܱ�8��������"+n);
			}
			n++;
		}
		
//		9������1*2*3*����*10�Ľ����	
		while(i<=10){
			avg=avg*i;
			
		}
		System.out.println("1*2*3*����*10�Ľ��"+avg);
//		11������һ����������¼�ڱ���m�У�  ����1+2+����+m�Ľ����
		System.out.println("������һ������"+y);
		Scanner x = new Scanner(System.in);
		int m = x.nextInt();
		

		while(y<=m){
			sum1=sum1+y;
			
			y++;
		}
		System.out.println("����һ����������¼�ڱ���m�У�  ����1+2+����+m�Ľ����"+sum1);
		System.out.println("1+2+3+4+����+100�Ľ��"+add);
		System.out.println("1+3+5+7.......+99�ĺ�"+sum);
//		12��ѭ������10��������ͳ����10���������ж��ٸ�ż����
		Scanner a = new Scanner(System.in);
		
		int c=1;
		int zheng = 0;
		while(c<=10){
			System.out.println("����һ������");
			int b = a.nextInt();
			if(b%2==0){
				zheng++;
				
			}
			c++;
		}
		System.out.println("����"+zheng+"��ż��");
//		13��һ���100�׸߶��������£�ÿ����غ�����ԭ�߶ȵ�һ�룻������
//		�������ڵ�10�����ʱ����ӡ�������������ף���ӡ����10�η�����ߣ�
		double height = 100;
		double sum2 =0 , tan = 0;
		int ci = 1;
		while(ci<10){
			sum2=sum2+height;
			height=height/2;
			sum2=height+sum2;
			ci++;
			
		}
		System.out.println("������������"+sum2);
		System.out.println(height);

//			14�����10000-99999��������л�������
//			��ʾ����12321�ǻ���������λ����λ��ͬ��ʮλ��ǧλ��ͬ��
			

		
	}
	
}
