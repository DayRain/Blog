-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: myblog
-- ------------------------------------------------------
-- Server version	5.5.62

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `article_id` int(16) NOT NULL AUTO_INCREMENT,
  `article_title` varchar(2000) NOT NULL,
  `writer_id` int(16) DEFAULT NULL,
  `article_create_time` datetime DEFAULT NULL,
  `article_content` text,
  `article_pageview` int(16) DEFAULT '0' COMMENT '阅读数',
  `classify_name` varchar(32) DEFAULT NULL,
  `article_comments` int(16) DEFAULT '0',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'Spring AOP 报错org.springframework.beans.factory.BeanCreationException: Error creating bean with name \'XXXXXX\' defined in class path resource..........',1,'2019-04-01 07:53:35','<p>完整报错如下：</p><p><br>org.springframework.beans.factory.BeanCreationException: Error creating bean with name \'beforeAdvice\' defined in class path resource [applicationContext.xml]: BeanPostProcessor before instantiation of bean failed; nested exception is org.springframework.beans.factory.BeanCreationException: Error creating bean with name \'org.springframework.aop.aspectj.AspectJPointcutAdvisor#0\': Bean instantiation via constructor failed; nested exception is org.springframework.beans.BeanInstantiationException: Failed to instantiate [org.springframework.aop.aspectj.AspectJPointcutAdvisor]: Constructor threw exception; nested exception is java.lang.IllegalArgumentException: Pointcut is not well-formed: expecting \'name pattern\' at character position 10<br>execution()</p><p>出现了一种&lt;aop:config&gt;标签与bean无法共存的现象，一开始以为是aspectj 包的版本问题，可修改来修改去，还是报错。</p><p>解决方案：后来发现，还是因为excution（）内的表达式写错了，修改后运行成功。</p><pre><code>&lt;aop:config&gt;<br>        &lt;aop:aspect id=\"beforeAspect\" ref=\"beforeAdvice\"&gt;<br>            &lt;aop:before method=\"methodBefore\" pointcut=\"execution(* com.ph.service..*.*(..))\"/&gt;<br>        &lt;/aop:aspect&gt;<br>    &lt;/aop:config&gt;</code></pre><p>如果排除了版本不匹配、注解没写等问题后，还是报错，就要考虑是不是execution表达式写错了。\n\n</p><p><br></p>',9,'ssm',0),(2,'451. Swap Nodes in Pairs【LintCode java】',1,'2019-04-01 08:07:42','<div><div><h3>Description</h3></div><div><div><p>Given a linked list, swap every two adjacent nodes and return its head.</p></div></div></div><div><div><h3>Example</h3></div><div><div><p>Given&nbsp;<code>1-&gt;2-&gt;3-&gt;4</code>, you should return the list as&nbsp;<code>2-&gt;1-&gt;4-&gt;3</code>.</p></div></div></div><div><div><h3>Challenge</h3></div><div><div><p>Your algorithm should use only constant space. You may not modify the values in the list, only nodes itself can be changed.</p><p>解题：将链表中的结点换一下位置。代码如下：</p><pre><code>/**<br> * Definition for ListNode<br> * public class ListNode {<br> *     int val;<br> *     ListNode next;<br> *     ListNode(int x) {<br> *         val = x;<br> *         next = null;<br> *     }<br> * }<br> */<br><br>public class Solution {<br>    /**<br>     * @param head: a ListNode<br>     * @return: a ListNode<br>     */<br>    public ListNode swapPairs(ListNode head) {<br>        // write your code here<br>        ListNode dummy = new ListNode(-1);<br>        dummy.next = head;<br>        ListNode pre = dummy;<br>        while(pre.next != null &amp;&amp; pre.next.next != null){<br>            ListNode t = pre.next.next;<br>            pre.next.next = t.next;<br>            t.next = pre.next;<br>            pre.next = t;<br>            pre = t.next;<br>        }<br>        return dummy.next;<br>    }<br>}<br>复制代码</code></pre><p><br></p></div></div></div>',6,'leetCode',0),(3,'445. Cosine Similarity【LintCode java】',1,'2019-04-01 08:09:33','<div><div><h3>Description</h3></div><div><p>Cosine similarity is a measure of similarity between two vectors of an inner product space that measures the cosine of the angle between them. The cosine of 0° is 1, and it is less than 1 for any other angle.</p><p>Here is the formula:</p><p><img src=\"https://lintcode-media.s3.amazonaws.com/problem/cosine-similarity.png\" alt=\"cosine-similarity\"></p><p>Given two vectors A and B with the same size, calculate the cosine similarity.</p><p>Return&nbsp;<code>2.0000</code>&nbsp;if cosine similarity is invalid (for example A = [0] and B = [0]).</p></div></div><div><div><h3>Example</h3></div><div><div><p>Given A =&nbsp;<code>[1, 2, 3]</code>, B =&nbsp;<code>[2, 3 ,4]</code>.</p><p>Return&nbsp;<code>0.9926</code>.</p><p>Given A =&nbsp;<code>[0]</code>, B =&nbsp;<code>[0]</code>.</p><p>Return&nbsp;<code>2.0000</code></p><div><div><div><p>解题：按照公式计算，对特殊情况进行处理（数组不为空、分母不为0）。代码如下</p><pre><code>public class Solution {<br>    /*<br>     * @param A: An integer array<br>     * @param B: An integer array<br>     * @return: Cosine similarity<br>     */<br>    public double cosineSimilarity(int[] A, int[] B) {<br>        // write your code here<br>        if(A.length == 0 || B.length == 0)<br>             return 2.0000;<br>        int a = 0;<br>        int b = 0;<br>        int sum = 0;<br>        for(int i = 0; i &lt; A.length; i++){<br>            a = a + A[i] * A[i];<br>            b = b + B[i] * B[i];<br>            sum = sum + A[i] * B[i];<br>        }<br>        if(a == 0 || b == 0)<br>            return 2.000;<br>        return (double)sum / (Math.sqrt(a) * Math.sqrt(b));<br>    }<br>}</code></pre><p><br></p></div></div></div></div></div></div><p><br></p>',33,'leetCode',0),(5,'测试2',1,'2019-04-01 08:10:16','<p>测试1</p>',2,'默认',0),(6,'测试3',1,'2019-04-01 08:10:28','<p>测试3</p>',1,'默认',0),(7,'测试1测试1',1,'2019-04-01 08:10:46','<p>测试1测试1测试1</p>',3,'默认',0),(9,'小宝',2,'2019-04-02 19:40:27','<p>我爱你</p>',0,'大宝语录',0);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-16 15:17:12
