def cal_ap(recoms, num_actual_add):
    '''
    Calculate AP by calculating Precision and Recall

    :param recoms: Array of binary [1,0,0] with 1 is True
    :param num_actual_add: number of labels

    :return: result of AP
    '''

    precs = []
    recalls = []

    for indx, rec in enumerate(recoms):
        precs.append(sum(recoms[:indx+1])/(indx+1))
        recalls.append(sum(recoms[:indx+1])/num_actual_add)
    ap = (1/num_actual_add) * (sum(precs[i]*recoms[i] for i in range(len(recoms))))

    print('Precision final: ',precs)
    print('Recall final: ', recalls)
    print('AP final: ', ap)
    
    return ap
# cal_ap([1,1,1], 3)

menu_array = [['bún sứa', 'nước ép lê'], ['bánh pizza nấm', 'sữa tươi']]
menu_array = [', '.join(recipe for recipe in menu).capitalize() for menu in menu_array]
print(menu_array)

