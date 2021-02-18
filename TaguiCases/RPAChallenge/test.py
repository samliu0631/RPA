import rpa as r

r.init(visual_automation = True)
r.url('https://www.baidu.com')
r.type('q','decentralization[enter]')
r.snap('page','results.png')

r.keyboard('[cmd][space]')
r.keyboard('safari[enter]')
r.keyboard('[cmd]t')
r.keyboard('joker[enter]')

r.close()