<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Relatório Mensal</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@2.44.0/tabler-icons.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.1/chart.umd.js"></script>
<style>
  *{box-sizing:border-box;margin:0;padding:0}
  :root{
    --bg-primary:#ffffff;--bg-secondary:#f5f5f4;--bg-tertiary:#f0efed;
    --text-primary:#1a1a1a;--text-secondary:#6b7280;--text-tertiary:#9ca3af;
    --border:#e5e7eb;--border-hover:#d1d5db;
    --green:#1D9E75;--green-light:#E1F5EE;--green-dark:#0F6E56;
    --blue-light:#E6F1FB;--blue-text:#185FA5;
    --red-light:#FCEBEB;--red-text:#A32D2D;
    --amber-light:#FAEEDA;--amber-text:#854F0B;
    --radius:8px;--radius-lg:12px;
  }
  @media(prefers-color-scheme:dark){
    :root{
      --bg-primary:#1c1c1e;--bg-secondary:#2c2c2e;--bg-tertiary:#111111;
      --text-primary:#f2f2f7;--text-secondary:#aeaeb2;--text-tertiary:#636366;
      --border:#3a3a3c;--border-hover:#48484a;
    }
  }
  body{font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif;background:var(--bg-tertiary);min-height:100vh;color:var(--text-primary)}
  .app{max-width:920px;margin:0 auto;padding:1.5rem 1rem 3rem}
  .hidden{display:none!important}
  .btn{padding:8px 16px;border-radius:var(--radius);border:1px solid var(--border-hover);background:var(--bg-primary);color:var(--text-primary);font-size:13px;cursor:pointer;font-family:inherit;display:inline-flex;align-items:center;gap:6px;transition:.15s}
  .btn:hover{background:var(--bg-secondary)}
  .btn-primary{background:var(--green);border-color:var(--green);color:#fff}
  .btn-primary:hover{background:var(--green-dark);border-color:var(--green-dark)}
  .btn-sm{padding:5px 12px;font-size:12px}
  .card{background:var(--bg-primary);border:1px solid var(--border);border-radius:var(--radius-lg);padding:1.25rem;margin-bottom:1rem}
  input,select,textarea{width:100%;padding:8px 10px;border:1px solid var(--border);border-radius:var(--radius);background:var(--bg-primary);color:var(--text-primary);font-size:13px;font-family:inherit;transition:.15s}
  input:focus,select:focus,textarea:focus{outline:none;border-color:var(--green);box-shadow:0 0 0 3px rgba(29,158,117,.12)}
  textarea{resize:vertical;min-height:75px}
  label{font-size:12px;color:var(--text-secondary);display:block;margin-bottom:3px}
  .fg{margin-bottom:12px}
  .g2{display:grid;grid-template-columns:1fr 1fr;gap:12px}
  @media(max-width:600px){.g2{grid-template-columns:1fr}}
  h2{font-size:17px;font-weight:600;color:var(--text-primary);margin-bottom:.85rem}
  h3{font-size:14px;font-weight:600;color:var(--text-primary);margin-bottom:.65rem}
  .tab-bar{display:flex;gap:2px;margin-bottom:1.25rem;border-bottom:1px solid var(--border);flex-wrap:wrap}
  .tab{padding:7px 13px;font-size:13px;cursor:pointer;border:none;background:none;color:var(--text-secondary);border-bottom:2px solid transparent;margin-bottom:-1px;font-family:inherit;white-space:nowrap;transition:.15s}
  .tab:hover{color:var(--text-primary)}
  .tab.active{color:var(--green);border-bottom-color:var(--green);font-weight:600}
  .sec-title{font-size:11px;font-weight:600;color:var(--text-secondary);text-transform:uppercase;letter-spacing:.06em;margin:1.1rem 0 .65rem}
  .pill{display:inline-block;padding:2px 9px;border-radius:20px;font-size:11px;font-weight:500}
  .p-green{background:var(--green-light);color:#3B6D11}
  .p-blue{background:var(--blue-light);color:var(--blue-text)}
  .p-red{background:var(--red-light);color:var(--red-text)}
  .p-gray{background:var(--bg-secondary);color:var(--text-secondary)}
  .p-amber{background:var(--amber-light);color:var(--amber-text)}
  .kpi-row{display:flex;align-items:center;justify-content:space-between;padding:9px 0;border-bottom:1px solid var(--border)}
  .kpi-row:last-child{border:none}
  .login-wrap{display:flex;align-items:center;justify-content:center;min-height:90vh}
  .login-box{background:var(--bg-primary);border:1px solid var(--border);border-radius:var(--radius-lg);padding:2rem;width:100%;max-width:370px;box-shadow:0 4px 24px rgba(0,0,0,.08)}
  .logo{width:40px;height:40px;border-radius:10px;background:var(--green);display:flex;align-items:center;justify-content:center;margin-bottom:1rem}
  .rm-btn{background:none;border:none;cursor:pointer;color:var(--text-tertiary);font-size:16px;padding:0 2px;line-height:1;transition:.15s}
  .rm-btn:hover{color:var(--red-text)}
  .alert{padding:9px 13px;border-radius:var(--radius);font-size:13px;margin-bottom:10px}
  .a-ok{background:var(--green-light);color:#3B6D11;border:1px solid #97C459}
  .a-err{background:var(--red-light);color:var(--red-text);border:1px solid #F09595}
  .client-hero{background:linear-gradient(135deg,var(--green) 0%,#085041 100%);color:#fff;padding:1.75rem;border-radius:var(--radius-lg);margin-bottom:1rem}
  .prog-wrap2{background:var(--bg-secondary);border-radius:20px;height:7px;overflow:hidden;margin-top:4px}
  .prog-bar2{height:7px;border-radius:20px;background:var(--green);transition:width .6s}
  .img-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(140px,1fr));gap:10px;margin-top:10px}
  .img-thumb{position:relative;border-radius:var(--radius);overflow:hidden;aspect-ratio:4/3;background:var(--bg-secondary);border:1px solid var(--border)}
  .img-thumb img{width:100%;height:100%;object-fit:cover;display:block}
  .img-cap{position:absolute;bottom:0;left:0;right:0;background:rgba(0,0,0,.6);color:#fff;font-size:11px;padding:4px 7px}
  .img-rm{position:absolute;top:4px;right:4px;background:rgba(0,0,0,.5);border:none;cursor:pointer;color:#fff;border-radius:50%;width:22px;height:22px;font-size:14px;display:flex;align-items:center;justify-content:center}
  .msg-bubble{padding:10px 13px;border-radius:var(--radius);margin-bottom:8px;max-width:85%}
  .msg-admin{background:var(--green-light);align-self:flex-start}
  .msg-client{background:var(--blue-light);align-self:flex-end;margin-left:auto}
  .msgs-wrap{display:flex;flex-direction:column;gap:4px;max-height:320px;overflow-y:auto;padding:4px 0}
  .month-hist{display:grid;grid-template-columns:repeat(auto-fill,minmax(160px,1fr));gap:10px}
  .month-card{background:var(--bg-secondary);border-radius:var(--radius);padding:12px;cursor:pointer;border:1px solid var(--border);transition:.15s}
  .month-card:hover{border-color:var(--green);background:var(--green-light)}
  .drop-zone{border:2px dashed var(--border-hover);border-radius:var(--radius);padding:24px;text-align:center;cursor:pointer;background:var(--bg-secondary);transition:.15s}
  .drop-zone:hover{border-color:var(--green);background:var(--green-light)}
  .top-bar{display:flex;align-items:center;justify-content:space-between;margin-bottom:1.5rem;flex-wrap:wrap;gap:10px}
</style>
</head>
<body>
<div class="app" id="root">

  <!-- LOGIN -->
  <div id="login-screen" class="login-wrap">
    <div class="login-box">
      <div class="logo"><i class="ti ti-chart-bar" style="color:#fff;font-size:20px"></i></div>
      <h2 style="margin-bottom:3px">Relatório Mensal</h2>
      <p style="font-size:13px;color:var(--text-secondary);margin-bottom:1.25rem">Acesse como administrador ou cliente</p>
      <div id="login-alert"></div>
      <div class="fg"><label>Tipo de acesso</label>
        <select id="login-role"><option value="admin">Administrador</option><option value="client">Cliente</option></select>
      </div>
      <div class="fg"><label>Senha</label><input type="password" id="login-pass" placeholder="Digite sua senha" /></div>
      <button class="btn btn-primary" style="width:100%" onclick="doLogin()">Entrar</button>
    </div>
  </div>

  <!-- ADMIN -->
  <div id="admin-screen" class="hidden">
    <div class="top-bar">
      <div style="display:flex;align-items:center;gap:10px">
        <div class="logo"><i class="ti ti-chart-bar" style="color:#fff;font-size:18px"></i></div>
        <div><p style="font-size:11px;color:var(--text-secondary)">Painel Admin</p><h2 style="margin:0;font-size:16px">Relatório Mensal</h2></div>
      </div>
      <div style="display:flex;gap:8px;flex-wrap:wrap">
        <button class="btn btn-sm btn-primary" onclick="saveMonth()"><i class="ti ti-device-floppy"></i> Salvar mês</button>
        <button class="btn btn-sm" onclick="logout()"><i class="ti ti-logout"></i> Sair</button>
      </div>
    </div>

    <div class="tab-bar">
      <button class="tab active" onclick="adminTab(this,'at-config')"><i class="ti ti-settings"></i> Config</button>
      <button class="tab" onclick="adminTab(this,'at-metrics')"><i class="ti ti-chart-line"></i> Métricas</button>
      <button class="tab" onclick="adminTab(this,'at-kpis')"><i class="ti ti-list-check"></i> Resultados</button>
      <button class="tab" onclick="adminTab(this,'at-images')"><i class="ti ti-photo"></i> Imagens</button>
      <button class="tab" onclick="adminTab(this,'at-msgs')"><i class="ti ti-message-circle"></i> Mensagens</button>
      <button class="tab" onclick="adminTab(this,'at-history')"><i class="ti ti-history"></i> Histórico</button>
      <button class="tab" onclick="adminTab(this,'at-preview')"><i class="ti ti-eye"></i> Preview</button>
    </div>

    <!-- CONFIG -->
    <div id="at-config">
      <div class="card">
        <h3><i class="ti ti-building" style="margin-right:6px"></i>Informações do cliente</h3>
        <div class="g2">
          <div class="fg"><label>Nome da empresa</label><input id="c-empresa" placeholder="Ex: Agência XYZ" /></div>
          <div class="fg"><label>Nicho / Setor</label><input id="c-nicho" placeholder="Ex: Marketing Digital" /></div>
          <div class="fg"><label>Período do relatório</label><input id="c-periodo" placeholder="Ex: Maio 2025" /></div>
          <div class="fg"><label>Responsável</label><input id="c-resp" placeholder="Seu nome ou agência" /></div>
        </div>
        <div class="fg"><label>Mensagem de destaque</label><textarea id="c-destaque" placeholder="Ex: Excelente mês! Batemos a meta de leads..."></textarea></div>
      </div>
      <div class="card">
        <h3><i class="ti ti-lock" style="margin-right:6px"></i>Senhas de acesso</h3>
        <div class="g2">
          <div class="fg"><label>Senha do administrador</label><input type="password" id="c-pass-admin" placeholder="Em branco = manter atual" /></div>
          <div class="fg"><label>Senha do cliente</label><input type="password" id="c-pass-client" placeholder="Em branco = manter atual" /></div>
        </div>
        <button class="btn btn-primary" onclick="saveConfig()">Salvar configurações</button>
        <div id="cfg-alert" style="margin-top:8px"></div>
      </div>
    </div>

    <!-- METRICS -->
    <div id="at-metrics" class="hidden">
      <div class="card">
        <h3><i class="ti ti-adjustments" style="margin-right:6px"></i>Métricas do período atual</h3>
        <p style="font-size:12px;color:var(--text-secondary);margin-bottom:12px">Os valores são usados no gráfico de evolução histórica automaticamente.</p>
        <div id="metrics-list"></div>
        <div class="card" style="background:var(--bg-secondary);border-style:dashed;margin-top:12px">
          <p class="sec-title" style="margin-top:0">+ Nova métrica</p>
          <div class="g2">
            <div class="fg"><label>Nome</label><input id="m-nome" placeholder="Ex: Seguidores, Leads, Visitas" /></div>
            <div class="fg"><label>Ícone</label>
              <select id="m-icon">
                <option value="ti-users">Usuários / Seguidores</option>
                <option value="ti-chart-line">Crescimento</option>
                <option value="ti-eye">Visualizações</option>
                <option value="ti-click">Cliques</option>
                <option value="ti-mail">E-mails</option>
                <option value="ti-star">Avaliações</option>
                <option value="ti-currency-dollar">Receita / Faturamento</option>
                <option value="ti-shopping-cart">Vendas</option>
                <option value="ti-thumb-up">Engajamento</option>
                <option value="ti-share">Compartilhamentos</option>
                <option value="ti-device-mobile">Acessos mobile</option>
                <option value="ti-search">Buscas / SEO</option>
                <option value="ti-ad">Anúncios</option>
                <option value="ti-bulb">Leads</option>
              </select>
            </div>
            <div class="fg"><label>Valor atual</label><input id="m-atual" placeholder="Ex: 1250" /></div>
            <div class="fg"><label>Valor anterior</label><input id="m-anterior" placeholder="Ex: 980" /></div>
            <div class="fg"><label>Unidade</label><input id="m-unidade" placeholder="Ex: seguidores, R$, visitas" /></div>
            <div class="fg"><label>Meta</label><input id="m-meta" placeholder="Ex: 2000" /></div>
          </div>
          <button class="btn btn-primary" onclick="addMetric()">+ Adicionar métrica</button>
        </div>
      </div>
    </div>

    <!-- KPIS -->
    <div id="at-kpis" class="hidden">
      <div class="card">
        <h3><i class="ti ti-list-check" style="margin-right:6px"></i>Resultados e entregas</h3>
        <div id="kpis-list"></div>
        <div class="card" style="background:var(--bg-secondary);border-style:dashed;margin-top:12px">
          <p class="sec-title" style="margin-top:0">+ Novo item</p>
          <div class="g2">
            <div class="fg"><label>Descrição</label><input id="k-desc" placeholder="Ex: 12 posts publicados no Instagram" /></div>
            <div class="fg"><label>Status</label>
              <select id="k-status">
                <option value="concluido">✅ Concluído</option>
                <option value="em-andamento">🔄 Em andamento</option>
                <option value="pendente">⏳ Pendente</option>
                <option value="proximo">🎯 Próximo passo</option>
              </select>
            </div>
          </div>
          <button class="btn btn-primary" onclick="addKpi()">+ Adicionar</button>
        </div>
      </div>
      <div class="card">
        <h3><i class="ti ti-notes" style="margin-right:6px"></i>Observações gerais</h3>
        <div class="fg"><textarea id="c-obs" placeholder="Análise do período, pontos de atenção, recomendações..."></textarea></div>
        <button class="btn btn-primary" onclick="saveObs()">Salvar</button>
        <div id="obs-alert" style="margin-top:6px"></div>
      </div>
    </div>

    <!-- IMAGES -->
    <div id="at-images" class="hidden">
      <div class="card">
        <h3><i class="ti ti-photo" style="margin-right:6px"></i>Imagens e capturas de tela</h3>
        <p style="font-size:12px;color:var(--text-secondary);margin-bottom:12px">Anexe prints de resultados, gráficos externos, campanhas, etc.</p>
        <div class="drop-zone" onclick="document.getElementById('img-input').click()">
          <i class="ti ti-cloud-upload" style="font-size:28px;color:var(--text-secondary)"></i>
          <p style="font-size:13px;color:var(--text-secondary);margin-top:8px">Clique para selecionar imagens</p>
          <p style="font-size:11px;color:var(--text-tertiary)">JPG, PNG, GIF · múltiplas ao mesmo tempo</p>
        </div>
        <input type="file" id="img-input" accept="image/*" multiple style="display:none" onchange="handleImages(event)" />
        <div id="admin-img-grid" class="img-grid"></div>
      </div>
    </div>

    <!-- MESSAGES -->
    <div id="at-msgs" class="hidden">
      <div class="card">
        <h3><i class="ti ti-message-circle" style="margin-right:6px"></i>Mensagens do cliente</h3>
        <p style="font-size:12px;color:var(--text-secondary);margin-bottom:10px">Feedbacks, ideias e pedidos enviados pelo cliente. Você também pode responder.</p>
        <div class="msgs-wrap" id="msgs-admin"></div>
        <div style="display:flex;gap:8px;margin-top:10px">
          <input id="msg-admin-input" placeholder="Responder ou adicionar observação..." style="flex:1" onkeydown="if(event.key==='Enter')sendMsg('admin')" />
          <button class="btn btn-primary btn-sm" onclick="sendMsg('admin')"><i class="ti ti-send"></i></button>
        </div>
      </div>
    </div>

    <!-- HISTORY -->
    <div id="at-history" class="hidden">
      <div class="card">
        <h3><i class="ti ti-history" style="margin-right:6px"></i>Histórico de meses</h3>
        <p style="font-size:12px;color:var(--text-secondary);margin-bottom:12px">Cada vez que você clicar em "Salvar mês", o período é registrado aqui.</p>
        <div id="history-list"></div>
      </div>
    </div>

    <!-- PREVIEW -->
    <div id="at-preview" class="hidden">
      <p style="font-size:12px;color:var(--text-secondary);margin-bottom:10px">Visualização exata do que o cliente verá ao fazer login.</p>
      <div id="preview-wrap"></div>
    </div>
  </div>

  <!-- CLIENT -->
  <div id="client-screen" class="hidden">
    <div style="display:flex;justify-content:flex-end;margin-bottom:.65rem">
      <button class="btn btn-sm" onclick="logout()"><i class="ti ti-logout"></i> Sair</button>
    </div>
    <div id="client-content"></div>
  </div>

</div>

<script>
var S = {
  adminPass:'admin123', clientPass:'cliente123',
  empresa:'Minha Empresa', nicho:'', periodo:'', responsavel:'', destaque:'', obs:'',
  metrics:[], kpis:[], images:[], msgs:[], history:[]
};

function persist(){try{localStorage.setItem('rlt_v2',JSON.stringify(S));}catch(e){}}
function hydrate(){try{var d=localStorage.getItem('rlt_v2');if(d)Object.assign(S,JSON.parse(d));}catch(e){}}

function doLogin(){
  var role=document.getElementById('login-role').value;
  var pass=document.getElementById('login-pass').value;
  var al=document.getElementById('login-alert');
  if(role==='admin'&&pass===S.adminPass){
    show('admin-screen');hide('login-screen');loadAdminFields();renderMetricsList();renderKpisList();renderAdminImgs();renderMsgs('admin');
  } else if(role==='client'&&pass===S.clientPass){
    show('client-screen');hide('login-screen');renderClient();
  } else {
    al.innerHTML='<div class="alert a-err">Senha incorreta. Tente novamente.</div>';
  }
}
document.getElementById('login-pass').addEventListener('keydown',function(e){if(e.key==='Enter')doLogin();});

function logout(){hide('admin-screen');hide('client-screen');show('login-screen');document.getElementById('login-pass').value='';document.getElementById('login-alert').innerHTML='';}
function show(id){document.getElementById(id).classList.remove('hidden');}
function hide(id){document.getElementById(id).classList.add('hidden');}

function adminTab(el,id){
  document.querySelectorAll('.tab').forEach(function(t){t.classList.remove('active');});
  el.classList.add('active');
  ['at-config','at-metrics','at-kpis','at-images','at-msgs','at-history','at-preview'].forEach(hide);
  show(id);
  if(id==='at-metrics')renderMetricsList();
  if(id==='at-kpis')renderKpisList();
  if(id==='at-images')renderAdminImgs();
  if(id==='at-msgs')renderMsgs('admin');
  if(id==='at-history')renderHistory();
  if(id==='at-preview'){document.getElementById('preview-wrap').innerHTML='';renderClientInto('preview-wrap',true);}
}

function loadAdminFields(){
  document.getElementById('c-empresa').value=S.empresa||'';
  document.getElementById('c-nicho').value=S.nicho||'';
  document.getElementById('c-periodo').value=S.periodo||'';
  document.getElementById('c-resp').value=S.responsavel||'';
  document.getElementById('c-destaque').value=S.destaque||'';
  document.getElementById('c-obs').value=S.obs||'';
}

function saveConfig(){
  var np=document.getElementById('c-pass-admin').value.trim();
  var nc=document.getElementById('c-pass-client').value.trim();
  S.empresa=document.getElementById('c-empresa').value||'Minha Empresa';
  S.nicho=document.getElementById('c-nicho').value;
  S.periodo=document.getElementById('c-periodo').value;
  S.responsavel=document.getElementById('c-resp').value;
  S.destaque=document.getElementById('c-destaque').value;
  if(np)S.adminPass=np;
  if(nc)S.clientPass=nc;
  persist();flash('cfg-alert','a-ok','Configurações salvas com sucesso!');
}

function saveObs(){S.obs=document.getElementById('c-obs').value;persist();flash('obs-alert','a-ok','Salvo!');}

function flash(id,cls,msg){
  var e=document.getElementById(id);
  e.innerHTML='<div class="alert '+cls+'">'+msg+'</div>';
  setTimeout(function(){e.innerHTML='';},3000);
}

function addMetric(){
  var nome=document.getElementById('m-nome').value.trim();
  var atual=document.getElementById('m-atual').value.trim();
  if(!nome||!atual){alert('Preencha o nome e o valor atual.');return;}
  S.metrics.push({id:Date.now(),nome:nome,icon:document.getElementById('m-icon').value,atual:atual,anterior:document.getElementById('m-anterior').value.trim(),unidade:document.getElementById('m-unidade').value.trim(),meta:document.getElementById('m-meta').value.trim()});
  ['m-nome','m-atual','m-anterior','m-unidade','m-meta'].forEach(function(i){document.getElementById(i).value='';});
  persist();renderMetricsList();
}

function removeMetric(id){S.metrics=S.metrics.filter(function(m){return m.id!==id;});persist();renderMetricsList();}

function renderMetricsList(){
  var el=document.getElementById('metrics-list');
  if(!S.metrics.length){el.innerHTML='<p style="font-size:13px;color:var(--text-secondary);margin-bottom:10px">Nenhuma métrica ainda.</p>';return;}
  el.innerHTML=S.metrics.map(function(m){
    return '<div style="display:flex;align-items:center;gap:8px;padding:9px 0;border-bottom:1px solid var(--border)">'+
      '<button class="rm-btn" onclick="removeMetric('+m.id+')">×</button>'+
      '<i class="ti '+m.icon+'" style="color:var(--green);font-size:16px;width:20px"></i>'+
      '<span style="flex:1;font-size:13px">'+m.nome+'</span>'+
      '<span style="font-size:13px;font-weight:600;color:var(--green)">'+m.atual+(m.unidade?' '+m.unidade:'')+'</span>'+
      (m.anterior?'<span style="font-size:12px;color:var(--text-secondary)">← '+m.anterior+'</span>':'')+
      (m.meta?'<span class="pill p-blue">Meta: '+m.meta+'</span>':'')+
    '</div>';
  }).join('');
}

function addKpi(){
  var desc=document.getElementById('k-desc').value.trim();
  if(!desc){alert('Preencha a descrição.');return;}
  S.kpis.push({id:Date.now(),desc:desc,status:document.getElementById('k-status').value});
  document.getElementById('k-desc').value='';
  persist();renderKpisList();
}

function removeKpi(id){S.kpis=S.kpis.filter(function(k){return k.id!==id;});persist();renderKpisList();}

function renderKpisList(){
  var el=document.getElementById('kpis-list');
  if(!S.kpis.length){el.innerHTML='<p style="font-size:13px;color:var(--text-secondary);margin-bottom:10px">Nenhum item ainda.</p>';return;}
  el.innerHTML=S.kpis.map(function(k){
    return '<div style="display:flex;align-items:center;gap:8px;padding:9px 0;border-bottom:1px solid var(--border)">'+
      '<button class="rm-btn" onclick="removeKpi('+k.id+')">×</button>'+
      '<span style="flex:1;font-size:13px">'+k.desc+'</span>'+
      '<span class="pill '+stPill(k.status)+'">'+stLabel(k.status)+'</span>'+
    '</div>';
  }).join('');
}

function handleImages(e){
  var files=Array.from(e.target.files);
  files.forEach(function(f){
    var reader=new FileReader();
    reader.onload=function(ev){
      var cap=prompt('Legenda para esta imagem (opcional):',f.name.replace(/\.[^.]+$/,''))||f.name;
      S.images.push({id:Date.now()+Math.random(),src:ev.target.result,cap:cap});
      persist();renderAdminImgs();
    };
    reader.readAsDataURL(f);
  });
  e.target.value='';
}

function removeImg(id){S.images=S.images.filter(function(i){return i.id!==id;});persist();renderAdminImgs();}

function renderAdminImgs(){
  var el=document.getElementById('admin-img-grid');
  if(!S.images.length){el.innerHTML='<p style="font-size:13px;color:var(--text-secondary);margin-top:10px">Nenhuma imagem adicionada.</p>';return;}
  el.innerHTML=S.images.map(function(i){
    return '<div class="img-thumb"><img src="'+i.src+'" alt="'+i.cap+'" /><div class="img-cap">'+i.cap+'</div><button class="img-rm" onclick="removeImg('+i.id+')">×</button></div>';
  }).join('');
}

function sendMsg(from){
  var inputId=from==='admin'?'msg-admin-input':'msg-client-input';
  var text=document.getElementById(inputId).value.trim();
  if(!text)return;
  S.msgs.push({id:Date.now(),from:from,text:text,time:new Date().toLocaleTimeString('pt-BR',{hour:'2-digit',minute:'2-digit'})});
  document.getElementById(inputId).value='';
  persist();
  renderMsgs('admin');
  var clientEl=document.getElementById('msgs-client');
  if(clientEl)renderMsgs('client');
}

function renderMsgs(view){
  var elId=view==='admin'?'msgs-admin':'msgs-client';
  var el=document.getElementById(elId);
  if(!el)return;
  if(!S.msgs.length){el.innerHTML='<p style="font-size:13px;color:var(--text-secondary)">Nenhuma mensagem ainda.</p>';return;}
  el.innerHTML=S.msgs.map(function(m){
    return '<div class="msg-bubble '+(m.from==='admin'?'msg-admin':'msg-client')+'">'+
      '<p style="font-size:12px;font-weight:600;color:'+(m.from==='admin'?'var(--green)':'var(--blue-text)')+';margin-bottom:2px">'+(m.from==='admin'?'📋 Admin':'💬 Cliente')+'</p>'+
      '<p style="font-size:13px">'+m.text+'</p>'+
      '<p style="font-size:11px;color:var(--text-tertiary);margin-top:3px;text-align:right">'+m.time+'</p>'+
    '</div>';
  }).join('');
  el.scrollTop=el.scrollHeight;
}

function saveMonth(){
  S.empresa=document.getElementById('c-empresa').value||S.empresa;
  S.periodo=document.getElementById('c-periodo').value||S.periodo;
  S.responsavel=document.getElementById('c-resp').value||S.responsavel;
  S.obs=document.getElementById('c-obs').value||S.obs;
  S.destaque=document.getElementById('c-destaque').value||S.destaque;
  var snap={
    id:Date.now(),
    periodo:S.periodo||new Date().toLocaleDateString('pt-BR',{month:'long',year:'numeric'}),
    empresa:S.empresa,
    metrics:JSON.parse(JSON.stringify(S.metrics)),
    kpis:JSON.parse(JSON.stringify(S.kpis)),
    obs:S.obs,
    destaque:S.destaque
  };
  S.history=S.history.filter(function(h){return h.periodo!==snap.periodo;});
  S.history.unshift(snap);
  if(S.history.length>24)S.history=S.history.slice(0,24);
  persist();
  var btns=document.querySelectorAll('.btn-primary');
  btns.forEach(function(b){
    if(b.textContent.indexOf('Salvar mês')>-1){
      var orig=b.innerHTML;b.innerHTML='✓ Mês salvo!';
      setTimeout(function(){b.innerHTML=orig;},2000);
    }
  });
}

function renderHistory(){
  var el=document.getElementById('history-list');
  if(!S.history.length){el.innerHTML='<p style="font-size:13px;color:var(--text-secondary)">Nenhum mês salvo. Clique em "Salvar mês" para registrar o período atual.</p>';return;}
  el.innerHTML='<div class="month-hist">'+S.history.map(function(h){
    return '<div class="month-card" onclick="loadSnap('+h.id+')">'+
      '<p style="font-size:11px;color:var(--text-secondary);margin-bottom:2px">'+h.empresa+'</p>'+
      '<p style="font-size:14px;font-weight:600">'+h.periodo+'</p>'+
      '<p style="font-size:11px;color:var(--text-tertiary);margin-top:4px">'+h.metrics.length+' métricas · '+h.kpis.length+' itens</p>'+
    '</div>';
  }).join('')+'</div>';
}

function loadSnap(id){
  var h=S.history.find(function(x){return x.id===id;});
  if(!h)return;
  if(!confirm('Carregar dados de "'+h.periodo+'"?\nOs dados do mês atual serão substituídos na tela (o histórico não será apagado).'))return;
  S.metrics=JSON.parse(JSON.stringify(h.metrics));
  S.kpis=JSON.parse(JSON.stringify(h.kpis));
  S.obs=h.obs;S.destaque=h.destaque;S.periodo=h.periodo;
  loadAdminFields();
  adminTab(document.querySelector('.tab'),'at-config');
}

function stLabel(s){return{concluido:'Concluído','em-andamento':'Em andamento',pendente:'Pendente',proximo:'Próximo passo'}[s]||s;}
function stPill(s){return{concluido:'p-green','em-andamento':'p-blue',pendente:'p-red',proximo:'p-amber'}[s]||'p-gray';}

function calcVar(a,b){
  var n=parseFloat(String(a).replace(/\./g,'').replace(',','.'));
  var p=parseFloat(String(b).replace(/\./g,'').replace(',','.'));
  if(isNaN(n)||isNaN(p)||p===0)return null;
  return((n-p)/p*100).toFixed(1);
}

var chartInstances=[];
function destroyCharts(){chartInstances.forEach(function(c){try{c.destroy();}catch(e){}});chartInstances=[];}

function buildCharts(containerId){
  if(!S.metrics.length)return;
  var wrap=document.getElementById(containerId);
  if(!wrap)return;
  var chartDiv=wrap.querySelector('#charts-section');
  if(!chartDiv)return;

  var histData={};
  var months=S.history.slice(0,6).reverse();
  months.forEach(function(h){
    h.metrics.forEach(function(m){
      if(!histData[m.nome])histData[m.nome]=[];
      histData[m.nome].push({periodo:h.periodo,val:parseFloat(String(m.atual).replace(/\./g,'').replace(',','.'))});
    });
  });
  S.metrics.forEach(function(m){
    var val=parseFloat(String(m.atual).replace(/\./g,'').replace(',','.'));
    if(!isNaN(val)){
      if(!histData[m.nome])histData[m.nome]=[];
      var cur=S.periodo||'Atual';
      if(!histData[m.nome].find(function(x){return x.periodo===cur;}))
        histData[m.nome].push({periodo:cur,val:val});
    }
  });

  var valid=Object.entries(histData).filter(function(e){return e[1].length>=2;});
  if(!valid.length){
    chartDiv.innerHTML='<p style="font-size:13px;color:var(--text-secondary)">Salve pelo menos 2 meses para ver a evolução em gráfico.</p>';
    return;
  }

  chartDiv.innerHTML='';
  var colors=['#1D9E75','#185FA5','#BA7517','#A32D2D','#534AB7','#3B6D11'];

  valid.forEach(function(entry,idx){
    var nome=entry[0],arr=entry[1];
    var cid='ch_'+idx+'_'+Date.now();
    var d=document.createElement('div');
    d.style.cssText='margin-bottom:1.5rem';
    d.innerHTML='<p style="font-size:13px;font-weight:600;color:var(--text-primary);margin-bottom:8px">'+nome+'</p><div style="position:relative;height:160px"><canvas id="'+cid+'" role="img" aria-label="Gráfico de evolução de '+nome+'">'+arr.map(function(x){return x.periodo+': '+x.val;}).join(', ')+'</canvas></div>';
    chartDiv.appendChild(d);
    setTimeout(function(){
      var ctx=document.getElementById(cid);
      if(!ctx)return;
      var color=colors[idx%colors.length];
      var inst=new Chart(ctx,{
        type:'line',
        data:{
          labels:arr.map(function(x){return x.periodo;}),
          datasets:[{label:nome,data:arr.map(function(x){return x.val;}),borderColor:color,backgroundColor:color+'22',tension:.35,fill:true,pointRadius:5,pointBackgroundColor:color,pointBorderColor:'#fff',pointBorderWidth:2}]
        },
        options:{responsive:true,maintainAspectRatio:false,plugins:{legend:{display:false}},scales:{x:{grid:{color:'rgba(128,128,128,.1)'},ticks:{font:{size:11}}},y:{grid:{color:'rgba(128,128,128,.1)'},ticks:{font:{size:11}}}}}
      });
      chartInstances.push(inst);
    },80);
  });
}

function renderClientInto(containerId, isPreview){
  destroyCharts();
  var el=document.getElementById(containerId);

  var metricsHTML=S.metrics.map(function(m){
    var v=calcVar(m.atual,m.anterior);
    var mNum=m.meta?parseFloat(String(m.meta).replace(/\./g,'').replace(',','.')):null;
    var aNum=parseFloat(String(m.atual).replace(/\./g,'').replace(',','.'));
    var pct=mNum&&!isNaN(aNum)&&mNum>0?Math.min(100,Math.round(aNum/mNum*100)):null;
    return '<div class="card" style="margin-bottom:10px">'+
      '<div style="display:flex;align-items:flex-start;gap:12px">'+
        '<div style="width:38px;height:38px;border-radius:10px;background:var(--green-light);display:flex;align-items:center;justify-content:center;flex-shrink:0">'+
          '<i class="ti '+m.icon+'" style="color:var(--green);font-size:19px"></i>'+
        '</div>'+
        '<div style="flex:1">'+
          '<p style="font-size:12px;color:var(--text-secondary);margin-bottom:2px">'+m.nome+'</p>'+
          '<div style="display:flex;align-items:baseline;gap:8px;flex-wrap:wrap">'+
            '<span style="font-size:22px;font-weight:700">'+m.atual+(m.unidade?' <span style="font-size:13px;font-weight:400;color:var(--text-secondary)">'+m.unidade+'</span>':'')+'</span>'+
            (v!==null?'<span class="pill '+(parseFloat(v)>=0?'p-green':'p-red')+'">'+(parseFloat(v)>=0?'↑':'↓')+' '+Math.abs(v)+'%</span>':'')+
          '</div>'+
          (m.anterior?'<p style="font-size:12px;color:var(--text-secondary);margin-top:1px">Mês anterior: '+m.anterior+(m.unidade?' '+m.unidade:'')+'</p>':'')+
          (pct!==null?'<div style="margin-top:8px"><div style="display:flex;justify-content:space-between;font-size:11px;color:var(--text-secondary);margin-bottom:3px"><span>Meta: '+m.meta+(m.unidade?' '+m.unidade:'')+'</span><span>'+pct+'%</span></div><div class="prog-wrap2"><div class="prog-bar2" style="width:'+pct+'%"></div></div></div>':'')+
        '</div>'+
      '</div>'+
    '</div>';
  }).join('');

  var kpisHTML=S.kpis.length?S.kpis.map(function(k){
    return '<div class="kpi-row"><span style="font-size:13px">'+k.desc+'</span><span class="pill '+stPill(k.status)+'">'+stLabel(k.status)+'</span></div>';
  }).join(''):'<p style="font-size:13px;color:var(--text-secondary)">Nenhum item registrado.</p>';

  var imgsHTML=S.images.length?'<p class="sec-title">Capturas e evidências</p><div class="card"><div class="img-grid">'+S.images.map(function(i){return '<div class="img-thumb"><img src="'+i.src+'" alt="'+i.cap+'" /><div class="img-cap">'+i.cap+'</div></div>';}).join('')+'</div></div>':'';

  var msgsSuffix=isPreview?'_prev':'';
  var msgsHTML='<p class="sec-title">Mensagens e feedbacks</p>'+
    '<div class="card">'+
      '<p style="font-size:12px;color:var(--text-secondary);margin-bottom:10px">Envie suas dúvidas, feedbacks ou ideias diretamente para a equipe.</p>'+
      '<div class="msgs-wrap" id="msgs-client'+msgsSuffix+'"></div>'+
      '<div style="display:flex;gap:8px;margin-top:10px">'+
        '<input id="msg-client-input'+msgsSuffix+'" placeholder="Escreva uma mensagem, ideia ou pedido..." style="flex:1" onkeydown="if(event.key===\'Enter\')sendMsg(\'client\')" />'+
        '<button class="btn btn-primary btn-sm" onclick="sendMsg(\'client\')"><i class="ti ti-send"></i></button>'+
      '</div>'+
    '</div>';

  el.innerHTML=
    '<div class="client-hero">'+
      '<p style="font-size:11px;opacity:.75;margin-bottom:4px">'+(S.responsavel||'Relatório')+(S.nicho?' · '+S.nicho:'')+'</p>'+
      '<h2 style="color:#fff;font-size:22px;margin-bottom:4px">'+S.empresa+'</h2>'+
      '<div style="display:flex;align-items:center;justify-content:space-between;flex-wrap:wrap;gap:8px">'+
        '<p style="font-size:13px;opacity:.85">'+(S.periodo||'Período atual')+'</p>'+
        (S.metrics.length?'<span style="background:rgba(255,255,255,.2);padding:3px 10px;border-radius:20px;font-size:12px">'+S.metrics.length+' indicadores</span>':'')+
      '</div>'+
    '</div>'+
    (S.destaque?'<div class="card" style="border-left:3px solid var(--green);border-radius:0 var(--radius-lg) var(--radius-lg) 0;margin-bottom:1rem"><p style="font-size:13px;color:var(--text-secondary);font-style:italic">"'+S.destaque+'"</p></div>':'')+
    (S.metrics.length?'<p class="sec-title">Indicadores do período</p>'+metricsHTML:'')+
    '<p class="sec-title" style="margin-top:1rem">Evolução ao longo do tempo</p>'+
    '<div class="card" id="charts-section"></div>'+
    '<p class="sec-title" style="margin-top:1rem">Resultados e entregas</p>'+
    '<div class="card">'+kpisHTML+'</div>'+
    imgsHTML+
    (S.obs?'<p class="sec-title">Observações da equipe</p><div class="card"><p style="font-size:13px;color:var(--text-secondary);line-height:1.7">'+S.obs+'</p></div>':'')+
    msgsHTML+
    '<p style="text-align:center;font-size:11px;color:var(--text-tertiary);margin-top:1.5rem">Relatório gerado por '+(S.responsavel||'sua equipe')+'</p>';

  setTimeout(function(){
    buildCharts(containerId);
    renderMsgs('client');
  },100);
}

function renderClient(){renderClientInto('client-content',false);}

hydrate();
</script>
</body>
</html>
