//
//  Grade7.swift
//  JiaoAn
//
//  Created by Marlon Ou on 2015-12-23.
//  Copyright (c) 2015 TPTJ. All rights reserved.
//

import UIKit

class Grade7: UITapGestureRecognizer{
    //comment testing
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
    //tom testing
    let name = "Grade 7"
    
    let problemSetArray : [Question] = [Samples().samples[0]]
    
    let fall = [mlFall, tzFall];
    let winter = [mlWinter, tzWinter];
    let summer = [mlSummer, tzSummer];
    
    //static let TOTALQUESTIONS = 9;
    
    //美丽的云 -- grade7sm
    static let mlTitle = "美丽的云"
    static let mlPara = "①碧蓝的天空，铺过来一层蚕丝般的云幕，不一会儿，太阳周围现出一道彩色光环。它宛若彩虹，但没有彩虹鲜亮；虹的色彩排列是内紫外红，而光环刚好相反，是外紫内红。这就是“晕”，俗称“风圈”。\n ②我们的祖先，很早就对“晕”进行了观察和记载。远在殷墟甲骨文中，已有“晕”字出现。到了西周，“晕”便正式作为天象被记录下来。而欧洲人直到1630年，才有关于“晕”的详细记载，比我国晚了一千多年。\n ③人们虽然很早就注意到了这种美丽的光象，但对它的成因作出科学的解释，则是近一二百年的事。1666年，牛顿做了一个很简单的但对后来科学发展影响很大的实验。他让一束阳光透过三棱镜，结果出现，红、橙、黄、绿、蓝、靛、紫的七色彩条。这使人类第一次认识到，阳光原来是由七种不同颜色的光组成的，当它们通过三棱镜时，由于波长、折射角不同，才显示了各自的本色。这一发现，给“晕”的科学解释打下了基础。 \n④探空资料表明，那白如蚕丝的云幕，其高度都在距地面5000米以上，是由六方柱体状的小冰晶组成的。如果把六方柱体不相邻的边延长，实际上就是三棱柱体。所以，六方柱体状的冰晶就像三棱镜一样，能把阳光分成七色彩条。当无数兆亿小冰晶被阳光照射后，各色光按一定角度折射出来，便形成了绚丽多彩的晕环。 \n⑤人们对“晕”的兴趣，不单因为它有斑斓的色彩，而且由于它是天气变化的一种前兆。据我国新疆阿勒泰地区统计，在1980天中就曾出现过1052次“晕”，“晕”后两天内出现风、雨等显著天气变化的占80％。 \n⑥不过，也不是所有的“晕”都是风雨之兆。气象工作者经过长期观察发现：当“晕”的持续时间在1小时以内(俗称“短晕”)时，未来的12小时—36小时内会出现风或雨； 当“晕”的持续时间在5小时以上(俗称“长晕”)时，则不会有风雨天气出现。 \n⑦美丽的晕环是大自然的天气预告图，我们了解并利用它来观测风云，可以更好地安排工作和生活。\n"
    
    //Fall
    static let ml00 = Multiple4Choice(difficulty: .Fall, title: mlTitle, mainQuestion: mlPara + " [理解]1．第③段中的“这一发现”指的是(    )  ", A:"阳光是由七种不同颜色的光组成的 " , B:" 对晕的成因作出科学解释的实验 " , C:" 人们很早就注意到这种光象 " , D:" 折射角不同，它们才显出各自的本色 " , correct: 0)
    
    //Winter
    static let ml01 = Multiple4Choice(difficulty: .Winter, title: mlTitle, mainQuestion: mlPara + " [结构]1.第⑥段中运用的说明方法是（   ）  ", A:" 作比较  列数字 " , B:" 作诠释  列数字 " , C:" 作诠释  作比较 " , D:" 分类别  列数字  " , correct: 3)
    
    static let ml02 = Multiple4Choice(difficulty: .Winter, title: mlTitle, mainQuestion: mlPara + " 2. 本文依次从哪几方面来说明晕的?下面概括正确的一项是(  ) ", A:" 解说概念 追溯历史 解释成因 说明作用 " , B:" 解说概念 追溯历史 记述实验 划分种类 " , C:" 描摹色彩 解说概念 解释成因 说明作用 " , D:" 描摹色彩 记述实验 解释成因 划分种类 " , correct: 0)
    
    //Summer
    static let ml03 = Multiple4Choice(difficulty: .Summer, title: mlTitle, mainQuestion: mlPara + " 对第④段内容的理解，正确的是(   )。 ", A:" 晕是阳光经过云层中冰晶的折射而形成的 " , B:" 晕是光线经过云层中冰晶的折射而形成的 " , C:" 晕是阳光经过空气的反射形成的 " , D:" 晕是光线经过空气的反射形成的 " , correct: 0)
    
    static let mlFall = [ml00];
    static let mlWinter = [ml01,ml02];
    static let mlSummer = [ml03];
    
    
    //躺在母亲身边 -- grade7jx
    //多选 tz01(AB),tz03(BC)
    static let tzTitle = "躺在母亲身边"
    static let tzPara = "①母亲病了，躺在床上，我就坐在母亲的床边玩电脑。\n②母亲大多数的时候是悄无声息地躺在床上的，但是有时候也会试探着想跟我说话。说她又觉得哪个地方不太舒服了，说她又做了一个可怕的梦了，说她年轻时有多么健康，一个人能干多少活了。这时我总是很不耐烦。\n③有一次，母亲突然探过身来凑近电脑说：“你一直在电脑上干什么?不累吗?” \n④“聊天。”我不耐烦地说。 \n⑤“聊天?跟谁聊啊?”母亲又问。\n⑥“一个外地的，不认识。”\n⑦“不认识?”母亲好像很是不解，“那说什么呀?”\n⑧“反正也无聊，随便说什么都行。”我说。\n⑨“哦。”母亲若有所思地看了一会儿，又像很累似的长叹一口气，重新躺回到床上。\n⑩我又聊了一会儿，无意中转头看看母亲，她正睁着眼看着天花板出神。我心里突然一动。我名义上是在这里陪伴母亲，可除了能为她做点饭倒杯水外，还做了什么?\n⑾母亲是生我的时候落下了病根，多年来一直_____(1)_____疾病的折磨，近年又添上了许多老年病。也许因为母亲常年生病，她自己不在乎了，我们也习以为常了，有时周末回家，也很少想着要主动帮她干点什么，总是她一个人里里外外地干这干那。\n⑿母亲这次犯病，就是累病的。她病了，不但得不到我们的同情，反而谁见了她都会抱怨，都觉得她把自己累病了，害得我们也跟着受累。每当我们抱怨的时候，母亲总是一声不吭，仿佛她真的做错了什么一样。\n⒀我关掉电脑，给母亲倒上一杯水。还没等我说什么，母亲却说：“看电脑累眼睛吧?快躺下闭着眼歇一歇。”\n ⒁我答应着，拉了一床被子就躺在母亲身边。我说：“妈，你给我说说你以前的事，我看看能不能写篇文章。”\n⒂母亲_____(2)______得一时不知该说什么。我静静地躺着，耐心地等着她说。\n⒃突然觉得，原来躺在母亲身边，就是这样的感觉——暖暖的。\n⒄我却已经遗忘多年了。\n"
    
    //Fall
    static let tz00 = Multiple4Choice(difficulty: .Fall, title: tzTitle, mainQuestion: tzPara + " [理解]1.阅读第②段画线的句子，说说其运用了什么修辞手法，有何作用。 ", A:" 运用比喻的修辞手法，写出了母亲生病时因身体不适需要人来照顾，以及多日卧床而倍感孤寂无聊，渴望与“我”说会儿话、解解闷的心理。 " , B:" 运用排比的修辞手法，写出了母亲生病时因身体不适需要人来照顾，以及多日卧床而倍感孤寂无聊，渴望与“我”说会儿话、解解闷的心理。 " , C:" 运用排比的修辞手法，写出了母亲体弱多病，多日卧床而感到孤寂无聊，自暴自弃。 " , D:" 运用比喻的修辞手法，写出了母亲体弱多病，多日卧床而感到孤寂无聊，自暴自弃。 " , correct: 1)
    
    static let tz01 = Multiple4Choice(difficulty: .Fall, title: tzTitle, mainQuestion: tzPara + " 2. 试分析第⑩⑾两段在文中的作用。 ", A:" 这两个自然段补充交代了母亲生病的原因及母亲生病时仍常年一个人忙里忙外、默默承受疾病折磨，最后积劳成疾却又遭受家人抱怨的事实 " , B:" 这样写使母亲的形象更加鲜明，文章内容更加充实，中心也更为突出 " , C:" 承上启下，呼应主体 " , D:" 表达出我对母亲的愧疚 " , correct: 1)
    
    //Winter
    static let tz02 = Multiple4Choice(difficulty: .Winter, title: tzTitle, mainQuestion: tzPara + " [结构]1、请结合语境，分析下列句子中加点短语运用的妙处: 突然觉得，原来躺在母亲身边，就是这样的感——暖暖的。 ", A:" “暖暖的”形象地写出了“我”躺在母亲身边的惬意之感。通过触觉之感含蓄隽永地表达出“我”多年后重新体验到亲情时的幸福感受。 " , B:" “暖暖的”写出了“我”在母亲身边感到母亲体温给我带来的温暖。表现出“我”当时感到寒冷。 " , C:" “暖暖的”形象地写出了“我”躺在母亲身边的惬意之感。含蓄地表达出“我”对母亲生病的担忧。 " , D:" “暖暖的”写出了“我”躺在母亲身边的疲惫之感。通过触觉之感表达了母亲的体温温暖了我的身体。 " , correct: 0)
    
    static let tz03 = Multiple4Choice(difficulty: .Winter, title: tzTitle, mainQuestion: tzPara + " [结构]2、根据文意，选择括号中恰当的词语填到(1)、(2)两处[请选择2个答案] ", A:" “倍受” -> (1) " , B:" “备受” -> (1) " , C:" “惊喜” -> (2) " , D:" “欢喜” -> (2) " , correct: 21)
    
    //Summer
    static let tz04 = Multiple4Choice(difficulty: .Summer, title: tzTitle, mainQuestion: tzPara + " [感悟]结尾“我却已经遗忘多年了”这句话该如何理解? ", A:" 在忙碌的现代生活中，人们常常沉迷于虚拟的网络世界里，忘记了对身边亲人的关爱。作者呼吁人们离开网络世界，用更多的时间陪伴亲人 " , B:" 在忙碌的现代生活中，人们常常沉迷于虚拟的网络世界里，忘记了对身边亲人的关爱。文章的结尾发出对人间真情的呼唤，升华了文章的主旨，读后发人深思。 " , C:" 呼吁人们教会自己的亲人投入到网络世界，让父母感受网络世界带给人们的便利 " , D:" 升华了文章的主旨，读后发人深思。 " , correct: 1)
    
    static let tzFall = [tz00,tz01];
    static let tzWinter = [tz02,tz03];
    static let tzSummer = [tz04];
    
    
}
