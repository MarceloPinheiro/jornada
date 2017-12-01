
//validando CNPJ
function validaCNPJ(campo,save,form){
    var cnpj = $("#"+campo).val();
    cnpj = cnpj.replace(".","");
    cnpj = cnpj.replace(".","");
    cnpj = cnpj.replace("/","");
    cnpj = cnpj.replace("-","");

    while(cnpj.length < 14) cnpj = "0"+ cnpj;

    cnpj1 = cnpj.substr(0,12);
    cnpj13 = cnpj.substr(12,1);
    cnpj14 = cnpj.substr(13,1);
    var dv1 = 0;
    var dv2 = 0;
    //variavies de apoio ao calculo
    var md1 = 9;
    var mds1 = 0;

    //parte 1 do calculo
    for(var n1=cnpj1.length;n1>0;n1--){
        var np = (cnpj1.substr((n1-1),1)*md1);
        mds1 += np;
        md1 -= 1;
        if(md1 == 1){
            md1 = 9;
        }
    }
    dv1 = mds1%11;
    if(dv1 == 10){
        dv1 = 0;
    }

    //parte 2 do calculo
    md1=9;
    mds1=0;
    cnpj1 = cnpj1+""+dv1;
    for(var n1=cnpj1.length;n1>0;n1--){
        var np = (cnpj1.substr((n1-1),1)*md1);
        mds1 += np;
        md1 -= 1;
        if(md1 == 1){
            md1 = 9;
        }
    }
    dv2 = mds1%11;

    if(dv2 == 10){
        dv2 = 0;
    }

    if(cnpj == "00000000000000"){
        $("#"+form).addClass("has-error");
        $("#"+form).removeClass("has-success");
        $("#"+save).addClass("disabled");
    }else if((dv1 == cnpj13) && (dv2 == cnpj14)){
        $("#"+save).removeClass("disabled");
        $("#"+form).addClass("has-success");
        $("#"+form).removeClass("has-error");
    }else{
        $("#"+form).addClass("has-error");
        $("#"+form).removeClass("has-success");
        $("#"+save).addClass("disabled");
    }

    //alert(cnpj1+" "+cnpj13+" "+dv1+" "+cnpj14+" "+dv2);
}

//validando cpf
function validaCPF(campo,save,form){
    var cnpj = $("#"+campo).val();
    cnpj = cnpj.replace(".","");
    cnpj = cnpj.replace(".","");
    cnpj = cnpj.replace("-","");

    while(cnpj.length < 11) cnpj = "0"+ cnpj;

    cnpj1 = cnpj.substr(0,9);
    cnpj13 = cnpj.substr(9,1);
    cnpj14 = cnpj.substr(10,1);
    var dv1 = 0;
    var dv2 = 0;
    //variavies de apoio ao calculo
    var md1 = 9;
    var mds1 = 0;

    //parte 1 do calculo
    for(var n1=cnpj1.length;n1>0;n1--){
        var np = (cnpj1.substr((n1-1),1)*md1);
        mds1 += np;
        md1 -= 1;
        
    }
    dv1 = mds1%11;

    if(dv1 == 10){
        dv1 = 0;
    }

    //parte 2 do calculo
    md1=9;
    mds1=0;
    cnpj1 = cnpj1+""+dv1;
    for(var n1=cnpj1.length;n1>0;n1--){
        var np = (cnpj1.substr((n1-1),1)*md1);
        mds1 += np;
        md1 -= 1;
        
    }
    dv2 = mds1%11;

    
    if(dv2 == 10){
        dv2 = 0;
    }

    if(cnpj == "00000000000"){
        $("#"+form).addClass("has-error");
        $("#"+form).removeClass("has-success");
        $("#"+save).addClass("disabled");
    }else if((dv1 == cnpj13) && (dv2 == cnpj14)){
        $("#"+save).removeClass("disabled");
        $("#"+form).addClass("has-success");
        $("#"+form).removeClass("has-error");
    }else{
        $("#"+form).addClass("has-error");
        $("#"+form).removeClass("has-success");
        $("#"+save).addClass("disabled");
    }
    //alert(cnpj1+" - "+cnpj13+" - "+dv1+" - "+cnpj14+" - "+dv2);
}

//formata de forma generica os campos
function formataCampo(campo, Mascara, evento) { 
        var boleanoMascara; 

        var Digitato = evento.keyCode;
        exp = /\-|\.|\/|\(|\)| /g
        campoSoNumeros = campo.value.toString().replace( exp, "" ); 

        var posicaoCampo = 0;    
        var NovoValorCampo="";
        var TamanhoMascara = campoSoNumeros.length;; 

        if (Digitato != 8) { // backspace 
                for(i=0; i<= TamanhoMascara; i++) { 
                        boleanoMascara  = ((Mascara.charAt(i) == "-") || (Mascara.charAt(i) == ".")
                                                                || (Mascara.charAt(i) == "/")) 
                        boleanoMascara  = boleanoMascara || ((Mascara.charAt(i) == "(") 
                                                                || (Mascara.charAt(i) == ")") || (Mascara.charAt(i) == " ")) 
                        if (boleanoMascara) { 
                                NovoValorCampo += Mascara.charAt(i); 
                                  TamanhoMascara++;
                        }else { 
                                NovoValorCampo += campoSoNumeros.charAt(posicaoCampo); 
                                posicaoCampo++; 
                          }              
                  }      
                campo.value = NovoValorCampo;
                  return true; 
        }else { 
                return true; 
        }
}