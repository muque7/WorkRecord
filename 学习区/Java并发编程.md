# Java并发编程

拉勾课程感悟和总结

### 第01讲

1. 机制与策略

   Tread类代表线程

   例如CallableTask实现callable接口重写run方法，就是将需要执行的任务加入到CallableTask中，再通过在Tread类中实例化CallableTask，将任务添加到Tread类中，实现多线程