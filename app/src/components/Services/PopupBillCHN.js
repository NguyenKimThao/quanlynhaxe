import React, { useState, useEffect } from 'react'
import lib from '../../lib'
import { Modal, ModalContent, DivFlexColumn, Input, DivFlexRow, Button, DelButton } from '../../styles'
import { connect } from 'react-redux'
import { GetListSalary } from '../../API/Salary'
import { getAllProduct, addBillProduct } from '../../actions/Product';


const PopupBillCHN = (props) => {

    let [nhacungcap, setNhaCungCap] = useState("");
    let [tenphutung, setTenPhuTung] = useState("");
    let [dongia, setDonGia] = useState(0);
    let [soluong, setSoLuong] = useState(1);
    let [chietkhau, setChietkhau] = useState(0);

    const searchTenPhuTung = (values) => {
        setTenPhuTung(values);
        let item = null;
        item = props.listCuaHangNgoai.find(function (e) {
            return (e.tenphutung.toLowerCase().includes(values.toLowerCase()));
        });

        if (item) {
            setNhaCungCap(item.nhacungcap);
            setDonGia(item.dongia);
            setSoLuong(1);
        };
    };

    const handleAdd = () => {
        if (nhacungcap === "" || tenphutung === "" || dongia === 0 || soluong === 0) {
            alert("Chưa nhập dữ liệu đầy đủ.");
            return;
        }
        var data = {
            key: props.listBillProduct.length + 1,
            tenphutungvacongviec: tenphutung,
            maphutung: "",
            dongia: parseInt(dongia) || 0,
            soluongphutung: parseInt(soluong) || 0,
            tiencong: 0,
            tongtien: parseInt(dongia * soluong) || 0,
            nhacungcap:nhacungcap
        }
        props.addBillProduct(data);
        clearData();
        props.onCloseClick();
    };

    const clearData = () => {
        setNhaCungCap("");
        setTenPhuTung("");
        setDonGia("");
        setSoLuong(1);
        setChietkhau(0);
    };


    useEffect(() => {
        if (props.isShowing) {

        };
    }, [props.isShowing]);

    return (
        <Modal className={props.isShowing ? "active" : ""}>
            <ModalContent>
                <DivFlexRow>
                    <DivFlexColumn style={{ flex: 1 }}>
                        <label>Nhà Cung Cấp </label>
                        <Input readOnly value={nhacungcap} onChange={(e) => setNhaCungCap(e.target.value)} />
                    </DivFlexColumn>
                    <DivFlexColumn style={{ flex: 1, marginLeft: 15 }}>
                        <label>Tên phụ tùng: </label>
                        <Input list="phu_tung" name="phu_tung" value={tenphutung} onChange={(e) => {
                            searchTenPhuTung(e.target.value);
                        }} />
                        <datalist id="phu_tung">
                            {props.listCuaHangNgoai && props.listCuaHangNgoai.map((item, index) => (
                                <option key={index}
                                    value={item.tenphutung}>{item.dongia}</option>
                            ))}
                        </datalist>

                    </DivFlexColumn>
                </DivFlexRow>

                <DivFlexRow>
                    <DivFlexColumn style={{ flex: 1 }}>
                        <label>Đơn giá: </label>
                        <Input readOnly type={"Number"} value={dongia} onChange={(e) => setDonGia(e.target.value)} />
                    </DivFlexColumn>
                    <DivFlexColumn style={{ flex: 1, marginLeft: 15 }}>

                        <label>Số lượng: </label>
                        <Input value={soluong} onChange={(e) => setSoLuong(e.target.value)} type={"Number"} />
                    </DivFlexColumn>
                </DivFlexRow>
                <DivFlexRow style={{ marginTop: 10, fontSize: 20, justifyContent: 'flex-end' }}>
                    <label>Tổng tiền: <span
                        style={{ fontWeight: 'bold' }}>{(parseInt(dongia) || 0) * (parseInt(soluong) || 0)} VND</span></label>
                </DivFlexRow>

                <DivFlexRow style={{ marginTop: 10, fontSize: 20, justifyContent: 'flex-end' }}>
                    <Button onClick={handleAdd}>Thêm</Button>
                    <DelButton style={{ marginLeft: 10 }} onClick={() => props.onCloseClick()}>Hủy</DelButton>
                </DivFlexRow>

            </ModalContent>
        </Modal>
    )
};

const mapState = (state) => ({
    token: state.Authenticate.token,
    listProduct: state.Product.listProduct,
    listBillProduct: state.Product.listBillProduct
});

const mapDispatch = (dispatch) => ({
    getAllProduct: (token) => {
        dispatch(getAllProduct(token))
    },
    addBillProduct: (data) => { dispatch(addBillProduct(data)) },
});

export default connect(mapState, mapDispatch)(PopupBillCHN);
